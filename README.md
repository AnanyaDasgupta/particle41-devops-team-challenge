# ⏱️ SimpleTimeService – Full Stack Deployment

Welcome to **SimpleTimeService**, a minimal microservice that tells you the current time and your IP address — deployable both **locally** and **on AWS** using infrastructure-as-code.

## 📁 Project Structure

```
.
├── SimpleTimeService/        # The actual Python + Flask microservice
│   └── README.md             # App-level instructions
├── terraform/                # Infrastructure code to deploy on AWS
│   └── README.md             # Infra-level documentation
├── .gitignore
└── README.md                 # You're here!
```

## 🚀 What You Can Do
| Task                             | Where to Look                      | Tech Stack                  |
|----------------------------------|------------------------------------|-----------------------------|
| 🔧 Run the app locally or in Docker | [`SimpleTimeService/`](./SimpleTimeService/) | Python, Flask, Docker       |
| ☁️ Deploy it on AWS using Terraform | [`terraform/`](./terraform/)       | Terraform, AWS ECS Fargate  |

## 🔍 Quick Overview
### 🧠 The Microservice
The microservice is a small Python app that returns:
```json
{
  "timestamp": "2025-04-16T10:42:33.123456+05:30",
  "ip": "122.161.66.85",
  "timezone": "Asia/Kolkata"
}
```
It uses:
- Flask (web framework)
- ipinfo.io (to resolve timezone from IP)

You can run it with:
- `python SimpleTimeService.py`
- or via Docker: `docker run -p 5000:5000 ananyadasgupta/simpletimeservice:latest`

📍 Details here → [`SimpleTimeService/README.md`](./SimpleTimeService/README.md)

### ☁️ The Cloud Deployment
Using the Terraform module in `terraform/`, you can:
- Provision a secure AWS environment using VPC, subnets, security groups, IAM roles, ECS Fargate, and Application Load Balancer.
- The infrastructure is completely defined with Terraform, making deployment repeatable and scalable.

📍 Details here → [`terraform/README.md`](./terraform/README.md)

## BONUS Section !!!

### CI/CD Pipeline Overview

This project uses GitHub Actions to automate the process of building Docker images, running Terraform plans, and applying infrastructure changes.

The pipeline consists of the following steps:

1. **Build Docker Image**:
   - Builds a Docker image using the `Dockerfile` located in the `app/` directory.
   - Pushes the built image to Docker Hub.

2. **Terraform Plan**:
   - Runs `terraform init -reconfigure` to initialize Terraform and ensure the environment is set up with the correct lock file and provider versions.
   - Executes `terraform plan` to create a plan for infrastructure changes.
   - Uploads the Terraform plan as an artifact for later use.

3. **Terraform Apply (Manual Approval)**:
   - Requires manual approval before applying infrastructure changes.
   - Downloads the Terraform plan artifact and runs `terraform apply` to deploy the infrastructure.

### Setup

1. **AWS Credentials**:
   Ensure that the following AWS credentials are set in the GitHub Secrets for your repository:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_DEFAULT_REGION`

2. **Docker Hub Credentials**:
   Ensure that your Docker Hub credentials are set in the GitHub Secrets:
   - `DOCKER_USERNAME`
   - `DOCKER_PASSWORD`

3. **Terraform Lock File**:
   The `.terraform.lock.hcl` file is automatically generated during the `terraform init -reconfigure` step in the pipeline. This ensures that the provider dependencies are locked to specific versions, ensuring consistent deployments.

### Troubleshooting

If you encounter issues with the Terraform lock file not being created or not persisting between jobs, ensure the following:

1. Terraform is initialized with `terraform init -reconfigure` in both the `plan` and `apply` jobs to regenerate the lock file if needed.
2. Ensure that the correct AWS credentials are set in your GitHub Secrets.
3. If Terraform errors persist related to provider versions, delete the `.terraform` directory and re-run the pipeline to regenerate the configuration and lock file.

### Conclusion

This setup ensures a robust CI/CD pipeline that automatically builds, plans, and applies infrastructure changes, while maintaining the security and consistency of your AWS infrastructure and Docker deployments.
