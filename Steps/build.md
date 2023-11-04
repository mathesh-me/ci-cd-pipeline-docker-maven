# Jenkins Pipeline Setup

This guide outlines the steps to set up a Jenkins pipeline for building and deploying a Java application using Docker containers. Follow these steps to configure your Jenkins pipeline.

## Step 1: Locate docker-compose.yml

Go to the section where the `docker-compose.yml` file is located.

## Step 2: Create the 'pipeline' Directory

Create a directory named "pipeline."

## Step 3: Navigate to the 'pipeline' Directory

Change to the "pipeline" directory and Create another directory named "jenkins."

## Step 4: Create and Edit Dockerfile

Create and edit a `Dockerfile` within the "pipeline" directory with the following content:

```Dockerfile
FROM jenkins/jenkins
USER root

# Install Docker
RUN apt-get update && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins
```

## Step 5: Locate docker-compose.yml (Again)
Go to the section where the docker-compose.yml file is located.

## Step 6: Modify docker-compose.yml
Modify the docker-compose.yml file with the following content:
```
version: '3'
services:
  jenkins:
    container_name: jenkins
    image: jenkins/docker
    build:
      context: pipeline
    ports:
      - "8080:8080"
    volumes:
      - "$PWD/jenkins_home:/var jenkins_home"
      - "/var/run/docker.sock:/var/run/docker.sock"
    networks:
      - net
networks:
  net:
```

## Step 7: Clone Jenkinsfile
Clone a Jenkinsfile from a GitHub repository:
```
git clone https://github.com/jenkins-docs/simple-java-maven-app/blob/master/jenkins/Jenkinsfile
```

## Step 8: Copy 'java-app' Directory
Copy the "java-app" directory to the "pipeline" directory:

```
cp -r java-app pipeline/java-app
```

## Step 9: Create the 'build' Directory
Create a "build" directory within the "pipeline/jenkins" directory:
```
mkdir -p pipeline/jenkins/build
cd pipeline/jenkins/build
```
## Step 10: Create build-jar.sh
Create a script named build-jar.sh within the "pipeline/jenkins/build" directory with the following content:
```
#!/bin/bash

echo "************************************"
echo "********* Building Jar *************"
echo "************************************"

# Build the JAR using Maven
docker run --rm -v $PWD/java-app:/app -v /root/.m2:/root/.m2 -w /app maven "$@"
```
```
chmod +x build-jar.sh
```

## Step 11: Navigate Back
Navigate back to the main directory:

```
cd ../..
```

## Step 12: Build the Maven Project
Build the Maven project within the "java-app" directory:

```
./jenkins/build/build-jar.sh mvn -B -DskipTests clean package
```
- It will create a jar file in the target folder

## Step 13: Copy the JAR File
Navigate back to the "pipeline/jenkins/build" directory:

```
cd jenkins/build
```
Copy the JAR file from the "java-app/target" directory:
    
```
cp java-app/target/my-app-1.0-SNAPSHOT.jar .
```
## Step 14: Create 'Dockerfile-java'
Create a Dockerfile-java in the main directory with the following content:
```
FROM openjdk:8-jre-alpine

RUN mkdir /app

COPY *.jar /app/app.jar

CMD java -jar /app/app.jar
```
## Step 15: Build the Docker Image
Build a Docker image named "test" from the "Dockerfile-java":

```
docker build -f Dockerfile-java -t test .
```

## Step 16: Run an Interactive Shell
Run an interactive shell in a Docker container from the "test" image:
```
docker run --rm -ti test sh
```

## Step 17: Run a Detached Container
Run a Docker container from the "test" image in detached mode:
```
docker run -d test
```
## Step 18: View Container Logs
View the logs of the Docker container:
```
docker logs -f CONTAINER_ID
```
## Step 19: Create docker-compose-build.yml
Create a docker-compose-build.yml file with the following content:
```
version: '3'
services:
  app:
    image: "maven:$BUILD_TAG"
    build:
      context: .
      dockerfile: Dockerfile-Java
```

## Step 20: Set the BUILD_TAG Variable
Set the "BUILD_TAG" environment variable:
```
export BUILD_TAG=2
```

## Step 21: Build Docker Image
Build the Docker image specified in the docker-compose-build.yml file:
```
docker-compose -f docker-compose-build.yml build
```

## Step 22: Create build.sh
Create a build.sh script with the following content:
```
#!/bin/bash

# Copy the new JAR to the build location
cp -f java-app/target/*.jar jenkins/build/

echo "#############################"
echo "### Building Docker Image ###"
echo "#############################"

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
```

## Step 23: Navigate Back
Navigate back to the main directory:
```
cd ../..
```
## Step 24: Make build.sh Executable
Make the build.sh script executable:
```
chmod +x jenkins/build/build.sh
```

## Step 25: Run build.sh
Run the build.sh script:
```
./jenkins/build/build.sh
```
- It will create a docker image with name maven:2