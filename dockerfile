# Construir a aplicacao
FROM maven:3.8.1-openjdk-17 AS builder
WORKDIR /src
COPY AvaliacaoCloudMinsait /src
RUN mvn clean install

# Criar a imagem do Docker
FROM khipu/openjdk17-alpine
WORKDIR /src
COPY --from=builder /src/target/AvaliacaoCloudMinsait-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]