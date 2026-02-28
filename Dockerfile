# Estágio 1: Compilação (Build)
FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /app

# Copia os arquivos de configuração do Maven e o wrapper
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
# Baixa as dependências (camada de cache)
RUN ./mvnw dependency:go-offline

# Copia o código fonte e compila o JAR
COPY src ./src
RUN ./mvnw clean package -DskipTests

# Estágio 2: Execução (Runtime)
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app


COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]