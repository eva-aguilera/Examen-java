FROM ubuntu:latest AS build
RUN apt-get install openjdk-21-jdk -y
COPY . .
FROM openjdk:21-jdk-slim
EXPOSE 8080
COPY --from=buil /build/libs/how-much-pay-api-0.0.1.jar app.jar

ENTRYPOINT ["java", "-jar","app-jar"]