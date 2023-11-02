#!/bin/bash

echo "#################################"
echo "######### Pushing image #########"
echo "#################################"

IMAGE="maven"

echo "** Logging in ***"
docker login -u mathesh1234 -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG mathesh1234/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push mathesh1234/$IMAGE:$BUILD_TAG
