FROM --platform=linux/amd64 openjdk:15-jdk-alpine

# Set environment variables
ENV WEBGOAT_VERSION=8.2.0
ENV WEBGOAT_HOME /opt/webgoat

# Create the WebGoat directory
RUN mkdir -p ${WEBGOAT_HOME}

# Download WebGoat
RUN wget https://github.com/WebGoat/WebGoat/releases/download/v${WEBGOAT_VERSION}/webgoat-server-${WEBGOAT_VERSION}.jar -O ${WEBGOAT_HOME}/webgoat.jar

# Expose the port WebGoat runs on
EXPOSE 8080

# Set the working directory
WORKDIR ${WEBGOAT_HOME}

# Run WebGoat
CMD ["java", "-jar", "webgoat.jar"]