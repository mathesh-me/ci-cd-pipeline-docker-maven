## Step 1: Create a 'test' Directory

Navigate to the "jenkins" directory and create a "test" directory:

```
cd jenkins
mkdir test
```

## Step 2: Create 'test.sh' Script
Create and edit a test.sh script within the "jenkins/test" directory with the following content:
    
```
#!/bin/bash

echo "####################################"
echo "######### Testing the Code #########"
echo "####################################"

docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven "$@"
```

## Step 3: Make 'test.sh' Executable
Make the test.sh script executable:

```
chmod +x test.sh
```

## Step 4: Navigate Back
Navigate back to the main directory:

```
cd ../..
```

## Step 5: Run the 'test.sh' Script
Run the test.sh script to test the code:

```
./jenkins/test/test.sh
```
- It will run the test cases and show the output as 'Success' or 'Failure'
- And store the test results in the target folder as `surefire-reports` folder.