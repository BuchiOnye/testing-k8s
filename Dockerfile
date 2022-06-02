FROM openjdk:11.0.3-jre-slim

VOLUME /tmp

WORKDIR /opt/holidu/apartment-api
ADD target/testing-k8s.jar /opt/holidu/test-k8s/app.jar

ENTRYPOINT ["java", "-XX:MinRAMPercentage=25.0", \
                    "-XX:MaxRAMPercentage=60.0", \
                    "-Djava.security.egd=file:/dev/./urandom", \
                    "-jar", "app.jar"]

EXPOSE 8080
