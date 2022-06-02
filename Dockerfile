FROM maven:3.6.3-jdk-11 AS MAVEN_BUILD

WORKDIR /build/

COPY pom.xml /build/

COPY src /build/src/

RUN mvn clean -U package

FROM openjdk:11.0.3-jre-slim

WORKDIR /app

EXPOSE 8080

COPY --from=MAVEN_BUILD /build/target/testing-k8s.jar /app

ENTRYPOINT ["java", "-jar", "testing-k8s.jar"]


