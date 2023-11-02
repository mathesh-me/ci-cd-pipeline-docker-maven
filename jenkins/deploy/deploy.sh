#!/bin/bash

echo "##################################"
echo "########### Deploying ############"
echo "##################################"

echo maven > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth ubuntu@13.127.148.3:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish ubuntu@13.127.148.3:/tmp/publish
ssh -i /opt/prod ubuntu@13.127.148.3 "/tmp/publish"
