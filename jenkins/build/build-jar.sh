#!/bin/bash

echo "#####################################"
echo "########## Building Jar #############"
echo "#####################################"

WORKSPACE=/home/ubuntu/jenkins_home/workspace/maven-project
docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven "$@"
