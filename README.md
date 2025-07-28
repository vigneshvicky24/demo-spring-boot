Spring Boot CI/CD Deployment with Docker, GitHub Actions, EC2 & Terraform

This project demonstrates an end-to-end automated deployment pipeline for a simple Spring Boot application. It includes:
✅ Maven build

🐳 Docker containerization

🔁 CI/CD using GitHub Actions

☁️ AWS infrastructure using Terraform

🌐 Load balancing with an Application Load Balancer (ALB)

Project Structure

demo-spring-boot/
├───.github
│   └───workflows
├───complete
│   ├───.github
│   │   └───workflows
│   ├───.gradle
│   │   ├───8.3
│   │   │   ├───checksums
│   │   │   ├───dependencies-accessors
│   │   │   ├───executionHistory
│   │   │   ├───fileChanges
│   │   │   ├───fileHashes
│   │   │   └───vcsMetadata
│   │   ├───buildOutputCleanup
│   │   └───vcs-1
│   ├───.mvn
│   │   └───wrapper
│   ├───build
│   │   ├───classes
│   │   │   └───java
│   │   │       ├───main
│   │   │       │   └───com
│   │   │       │       └───example
│   │   │       │           └───springboot
│   │   │       └───test
│   │   │           └───com
│   │   │               └───example
│   │   │                   └───springboot
│   │   ├───generated
│   │   │   └───sources
│   │   │       ├───annotationProcessor
│   │   │       │   └───java
│   │   │       │       ├───main
│   │   │       │       └───test
│   │   │       └───headers
│   │   │           └───java
│   │   │               ├───main
│   │   │               └───test
│   │   ├───libs
│   │   ├───reports
│   │   │   └───tests
│   │   │       └───test
│   │   │           ├───classes
│   │   │           ├───css
│   │   │           ├───js
│   │   │           └───packages
│   │   ├───resources
│   │   │   └───main
│   │   ├───test-results
│   │   │   └───test
│   │   │       └───binary
│   │   └───tmp
│   │       ├───bootJar
│   │       ├───compileJava
│   │       ├───compileTestJava
│   │       ├───jar
│   │       └───test
│   ├───gradle
│   │   └───wrapper
│   ├───src
│       ├───main
│       │   ├───java
│       │   │   └───com
│       │   │       └───example
│       │   │           └───springboot
│       │   └───resources
│       └───test
│           └───java
│               └───com
│                   └───example
│                        └───springboot
│       
└───terraform
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── terraform.tfvars
