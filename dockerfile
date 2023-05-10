FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -Dmaven.test.skip=true

FROM maven:3.8.3-openjdk-17 AS runtime
WORKDIR /app
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
USER 1002
ENTRYPOINT ["java", "-jar", "/app/demo-0.0.1-SNAPSHOT.jar"]

