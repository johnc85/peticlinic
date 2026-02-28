# Estágio 1: Compilação (Build)
FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src
RUN ./mvnw clean package -DskipTests

# Estágio 2: Execução (Runtime)
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Baixa o agente do Datadog diretamente na imagem final
ADD https://dtdg.co/latest-java-tracer /app/dd-java-agent.jar

# Copia o JAR da aplicação do estágio de build
COPY --from=build /app/target/*.jar app.jar

# Configura as variáveis do Java para usar o agente

# ENV JAVA_OPTS="-javaagent:/app/dd-java-agent.jar"

# ... (estágios anteriores)

# Use espaços para separar os argumentos. O sinal de '=' define a tag.
ENV JAVA_OPTS="-javaagent:/app/dd-java-agent.jar \
               -Ddd.trace.span.tags=custom.team:frontend,custom.framework:spring"

# ... (resto do Dockerfile)

EXPOSE 8080

# Inicializa a app com as JAVA_OPTS
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]