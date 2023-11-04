## Steps to create a pipeline
- Go to the Jenkins server
- Click on the 'New Item' in the left side of the dashboard
- Give a name as maven-pipeline
- Select 'Pipeline' and click 'OK'
- Scroll down to the 'Pipeline' section and select 'Pipeline script from SCM' in the 'Definition' dropdown
- Select 'Git' in the 'SCM' dropdown
- Give the repository URL as
```
https://github.com/Ehg-00/pipeline-1
```
- Click 'Save'
- Click 'Build Now'
- For first time it will fail because we have to add `/home/ubuntu/jenkins_home/workspace/maven-project` instead of $PWD in the `build-jar.sh` file and `test.sh` file.
- So we have to make changes in the `build-jar.sh` file and `test.sh` file , You can refer my repository for the changes.
- After done the Changes , Build the project again
- Now the project will be built successfully
- Click on the build number
- Click on 'Console Output' to see the output
- If you see the output as 'Success' then the pipeline is working fine
- If you see the output as 'Failure' then check the error and fix it
- If you see the output as 'Aborted' then check the error and fix it