Spring Boot CI/CD Deployment with Docker, GitHub Actions, EC2 & Terraform

This project demonstrates an end-to-end automated deployment pipeline for a simple Spring Boot application. It includes:
✅ Maven build

🐳 Docker containerization

🔁 CI/CD using GitHub Actions

☁️ AWS infrastructure using Terraform

🌐 Load balancing with an Application Load Balancer (ALB)

Project Structure

demo-spring-boot/
├── .github/
│   └── workflows/
│       └── ci-cd.yml                  # GitHub Actions pipeline
├── complete/
│   ├── .mvn/                          # Maven wrapper config
│   │   └── wrapper/
│   ├── gradle/                        # Gradle wrapper (unused)
│   │   └── wrapper/
│   ├── src/                           # Java source code
│   │   ├── main/
│   │   │   ├── java/
│   │   │   │   └── com/example/springboot/
│   │   │   └── resources/
│   │   └── test/
│   │       └── java/
│   │           └── com/example/springboot/
│   ├── Dockerfile                     # Docker build instructions
│   ├── pom.xml                        # Maven build file
│   └── target/                        # Maven build output (JAR file here)
│       └── spring-boot-0.0.1-SNAPSHOT.jar
├── terraform/
│   ├── main.tf                        # Terraform infrastructure config
│   ├── variables.tf                   # Variable definitions
│   ├── outputs.tf                     # Terraform output definitions
│   └── terraform.tfvars               # Custom values (vpc_id, subnet_ids, key_name)
├── deploy.sh                          # EC2 deploy script used by GitHub Actions
└── README.md                          # Full project documentation (this file)
