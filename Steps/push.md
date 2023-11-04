## Step 1 : Docker hub account creation
Create a docker hub account and note down the username and password

## Step 2 : Docker hub account configuration in jenkins
- Open jenkins in your browser and login with your credentials
- Click on "Manage Jenkins" on the left side menu
- Click on "Manage Credentials" on the left side menu
- Click on "Jenkins" on the left side menu
- Click on "Global credentials (unrestricted)" on the left side menu
- Click on "Add Credentials" on the left side menu
- Select "Secret text" from the "Kind" dropdown
- Enter your docker hub password in the "Secret" field
- Enter "docker-hub-password" in the "ID" field

## Step 3 : Create a bash script for pushing the image to docker hub
- Navigate to the "pipeline/jenkins" directory and create a "push" directory:
```
cd pipeline/jenkins
```
```
mkdir push
```
- Create a push.sh script within the "pipeline/jenkins/push" directory with the following content:
```
cd push
```
```
vi push.sh
```
```
#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven"

echo "** Logging in ***"
docker login - u docker-hub-username -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG docker-hub-username/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push docker-hub-username/$IMAGE:$BUILD_TAG
```
- Make the push.sh script executable:
```
chmod +x push.sh
```
- Navigate back to the main directory:
```
cd ../..
```
## Step 4 : Execute the push.sh script
- Run the push.sh script:
```
./jenkins/push/push.sh
```
- It will push the image to docker hub
