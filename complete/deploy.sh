#!/bin/bash

# Exit the script if any command fails
set -e


REPO_SSH_URL="git@github.com:vigneshvicky24/demo-spring-boot.git"
TARGET_FOLDER="demo-spring-boot/complete"
JAR_FILE="build/libs/spring-boot-0.0.1-SNAPSHOT.jar"


# Clone the repository
echo "Cloning repository from $REPO_SSH_URL..."
git clone $REPO_SSH_URL
cd $TARGET_FOLDER


# Build the project using Gradle 
echo "Building the project using Gradle..."
./gradlew build

# Check if JAR exists 

if [ -f "$JAR_FILE" ]; then
  echo "JAR file found: $JAR_FILE"
else
    echo "JAR file not found. Please check the build process."
    exit 1
    fi

# Run the JAR file
echo "Running the JAR file..."
nohup java -jar "$JAR_FILE" > app.log 2>&1 &

# Wait for a few seconds to ensure the application starts
sleep 5

# Check if the application is running
echo "✅ Application started in background."
echo "📄 Logs are being written to app.log"
echo "🌐 Visit: http://localhost:9000/"
