# Use an official Java runtime as a parent image
FROM eclipse-temurin:17-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the jar file into the container
COPY build/libs/spring-boot-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your app runs on
EXPOSE 9000

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
