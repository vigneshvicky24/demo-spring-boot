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


 Local Setup & Build

 cd complete/
 mvn clean package
 java -jar build/lib/Spring-0-0-1.jar

App runs on http://localhost:9000

Output: Greeting from springboot

🐳 Dockerize the Application
docker build -t demo-spring-app .
docker run -p 9000:9000 demo-spring-app


☁️ Provision AWS Infrastructure (Terraform)

Configure your variables inside terraform/terraform.tfvars
  vpc_id     = "vpc-xxxxxxx"
  subnet_ids = ["subnet-aaa", "subnet-bbb"]
  key_name   = "your-ec2-keypair"

Then run
  cd terraform/
  terraform init
  terraform apply -var-file="terraform.tfvars"

This will create
  EC2 instance with Docker
  Security group (ports 22, 80, 9000)
  ALB + Target Group

Configure GitHub Secrets
  Go to GitHub → Settings → Secrets → Actions → New repository secret
  
    | Secret Name      | Description                           |
    | ---------------- | ------------------------------------- |
    | DOCKER\_USERNAME | Docker Hub username                   |
    | DOCKER\_PASSWORD | Docker Hub password or access token   |
    | EC2\_HOST        | EC2 Public IP (from terraform output) |
    | EC2\_USER        | ubuntu (for Ubuntu AMI)               |
    | EC2\_SSH\_KEY    | Content of your .pem key (private)    |


Trigger the GitHub Actions Pipeline
  Push any code change to the main branch to trigger CI/CD
      git add .
      git commit -m "trigger pipeline"
      git push origin main

  The pipeline performs:

  Build with Maven
  Docker build & push to Docker Hub
  SSH into EC2 → pull image → run container

Access the App via Load Balancer

    Visit the ALB DNS output from Terraform:
    http://<your-alb-dns>
    ✅ You should see the app running:
    Greeting from springboot

Assumptions & Decisions

Used Maven (not Gradle) as the project was Maven-based

Exposed port 9000 as per task requirements

Hosted Docker image on Docker Hub for simplicity

Installed Docker via Terraform user-data script

Health check path set to "/" for Spring Boot default route

Switched from ap-south-1c to ap-south-1a/1b due to EC2 capacity issues

Updated deprecated GitHub Actions from v2/v3 to v4 for artifact handling





