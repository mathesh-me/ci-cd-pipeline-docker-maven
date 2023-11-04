# CI/CD Pipeline for Java Application using Docker and Maven 🚀

## Project Description 📄
Streamline a Java application development with a robust CI/CD pipeline. Automated building, testing, and deployment for efficient development workflows.

## Workflow Diagram 📊
![worflow](https://github.com/mathesh-me/ci-cd-pipeline-docker-maven/assets/144098846/f113d284-4dcb-4583-88d7-ce5b0cc475a4)


## Features ✨
- **Efficient Build Process**: Automate the compilation of our Java code using Maven. Create a deployable JAR and build a Docker image for our application. Archive successful artifacts for future reference.

- **Reliable Testing**: Ensure code quality with automated testing. Store test results for thorough quality assurance and bug tracking.

- **Seamless Deployment**: Push the Docker image to a Docker repository, making it easily accessible for deployment. Deploy our Java application on a target machine with confidence.

- **GitHub Webhooks**: Integrated GitHub webhooks to trigger the pipeline with every code push, enabling continuous integration and deployment.

## Prerequisites 📋
Before you start using this CI/CD pipeline, make sure you have the following tools and software installed:
- A Linux machine(Ubuntu Preffered) with Jenkins Installed.
- Docker Hub Account : Required for pushing Docker images.
- Jenkins Knowledge.

## Stages 📑

### This project consists of the following Stages:
### 1. Build
- **Purpose**: The ```Build``` stage automates the compilation of our Java code, creating a JAR file with Maven. It builds a Docker image for our application and archives successful artifacts for reference.
- **Benefits**: Streamline development, ensuring that our code is deployable and readily accessible in a Docker image.

### 2. Test
- **Purpose**: The ```Test``` stage is responsible for comprehensive code testing to guarantee correctness and quality. Test results are stored for review and analysis, allowing us to maintain high code quality.
- **Outcome**: Ensure that our application is free from defects and meets our quality standards.

### 3. Push
- **Purpose**: The ```Push``` stage simplifies sharing our Docker image. It uploads the Docker image to a Docker repository, making it easily accessible to our team or end-users.
- **Benefits**: Facilitate distribution and sharing of our application in Docker form.

### 4. Deploy
- **Purpose**: The ```Deploy``` stage automates the deployment of our Java application to a designated machine, ensuring accessibility for end-users.
- **Outcome**: Achieve a reliable and efficient deployment process with minimal manual intervention.

## Steps 📝
| Step No | Document Link |
| ------ | ------ |
| 1 | [Configuring Jenkins and Docker][Step-1] |
| 2 | [Build Stage][Step-2] |
| 3 | [Test stage][Step-3] |
| 4 | [Push Stage][Step-4] |
| 5 | [Deploy Stage][Step-5] |
| 6 | [Complete Pipeline][Step-6] |
| 7 | [Configuring Webhook][Step-7] |

   [Step-1]: <./Steps/configure.d>
   [Step-2]: <./Steps/build.md>   
   [Step-3]: <./Steps/test.md>
   [Step-4]: <./Steps/push.md>
   [Step-5]: <./Steps/deploy.md>  
   [Step-6]: <./Steps/complete.md>
   [Step-7]: <./Steps/webhook.md>


## Usage 🚀
To get started with the CI/CD pipeline for our Java application, follow these steps:

1. **Clone this Repository**: Clone this repository to your local development environment.

   ```bash
   git clone https://github.com/mathesh-me/ci-cd-pipeline-docker-maven.git
   ```
2. **Configuration**: Customize the pipeline configuration to match your project's specific requirements. Adjust pipeline files, scripts, and environment variables as needed.

3. **Commit Your Code**: Add your Java application's source code to this repository, making sure it's organized in accordance with your project's structure.

4. **Set Up Pipeline Triggers**: Configure GitHub webhooks to automatically trigger the pipeline with every code push, ensuring seamless integration and deployment.

## Contributing 🤝
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License 📄
This project is licensed under the MIT License. See the LICENSE.md file for details.

## Contact 📧
If you have any questions, feel free to reach out to me
- [LinkedIn](https://www.linkedin.com/in/mathesh-me/)
- Mail :matheshme@outlook.com
