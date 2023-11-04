## Step 1 : Create another virtual machine
- Create another virtual machine for deploying the application
- In my case I have created a virtual machine in AWS.
- Make sure to install docker and docker-compose in the virtual machine
- Make sure it allows ssh connection
- Make sure to copy the ssh key into some new file

## Step 2 : Copy the ssh key into the jenkins server
- Copy the ssh key into the file in pipeline folder in virtual machine
```
vi /opt/prod
```
- Then from pipeline folder copy the ssh key into jenkins container which is running jenkins server
```
docker cp /opt/prod jenkins:/opt/prod
```
- Then change the permission of the file
```
docker exec -it jenkins chmod 600 /opt/prod
```
## Step 3 : SSH into the virtual machine
- SSH into the virtual machine , from the pipeline folder run the following command
```
ssh -i /opt/prod ubuntu@<ip-address>
```
## Step 4 : Create a docker-compose.yml file inside the virtual machine
- After you successfully ssh into the virtual machine
- Create a folder named as maven
- Create a docker-compose.yml file in the folder
- Copy the following code into the file
```
version: '3'
services:
  maven:
    image: "mathesh/$IMAGE:$TAG"
    container_name: maven-app
```

## Step 5 : Create a Script file for deploying the application
- Come out if the virtual machine using `exit` command
- Create a folder named 'deploy' inside the pipeline/jenkins folder
- Create a file named 'deploy.sh' inside the deploy folder
- Copy the following code into the file
```
#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth user-name@host-ip:/tmp/.auth
```
- Here we giving values to BUILD_TAG and PASS from jenkins server , So we can test the deployment in the another virtual machine
```
export BUILD_TAG=1
export PASS=give-your-password
```
- Change the permission of the file
```
chmod +x deploy.sh
```
- If we run the `deploy.sh` script file now it will copy the values to /tmp/.auth file into the virtual machine.
- But we need to run the docker-compose.yml file to deploy the application
- So we need to add the another script file with name `publish.sh` inside the deploy folder
```
#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)

docker login -u user-name -p $PASS
cd ~/maven && docker-compose up -d
```

- Change the permission of the file
```
chmod +x publish.sh
```
- If we run the 'publish.sh' script file now it will deploy the application in the virtual machine

- Now we have to add two more lines in `deploy.sh` file to run the `publish.sh` file automtically
```
#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth prod-user@linuxfacilito.online:/tmp/.auth
scp -i prod ./jenkins/deploy/publish.sh ubuntu@13.232.128.241:/tmp/publish.sh
ssh -i prod ubuntu@13.232.128.241 "/tmp/publish.sh"
```
- After done all the above changes , Run the `deploy.sh` file from the pipeline folder
```
cd ../..
```
```
./jenkins/deploy/deploy.sh
```
- Now the application will be deployed in the virtual machine
- Now we have to add all the files we created into the github repository , In this case I assume that you already have a github repository and you also know how to add files into the repository
- Then we have to create a pipeline in jenkins server
- Then we have to configure the webhook in github repository
- Then we have to configure the pipeline to run automatically when we push the code into the github repository
