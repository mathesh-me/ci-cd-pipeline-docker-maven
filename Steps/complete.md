## Steps to create a pipeline
- Go to the Jenkins server
- Click on the 'New Item' in the left side of the dashboard
- Give a name as maven-pipeline
- Select 'Pipeline' and click 'OK'
- Scroll down to the 'Pipeline' section and select 'Pipeline script from SCM' in the 'Definition' dropdown
- Select 'Git' in the 'SCM' dropdown
- Give the repository URL as
```
https://github.com/your-user-name/repo-name.git
```
or you can use my repository URL
```
https://github.com/Ehg-00/pipeline-1.git
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
- May be you will find errors but keep troubleshooting , I also got errors many times

![errors](https://github.com/mathesh-me/ci-cd-pipeline-docker-maven/assets/144098846/e88d82f2-5d4a-4847-83e6-0f96abfbaca5)


## Final Result

![hw-3](https://github.com/mathesh-me/ci-cd-pipeline-docker-maven/assets/144098846/2af56b98-dea7-45cc-b4d2-fa019cdf99ca)
