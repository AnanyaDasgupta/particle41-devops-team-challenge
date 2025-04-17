
# SimpleTimeService AWS Infrastructure (Terraform)

This project provisions the infrastructure required to deploy the `SimpleTimeService` containerized application to AWS using **ECS Fargate**, **ALB**, and a secure **VPC** setup — all using **Terraform**.

---

## 🌐 Overview

- **VPC** with 2 public and 2 private subnets.
- **ECS Cluster** (Fargate launch type) running the `SimpleTimeService` Docker container.
- **ALB (Application Load Balancer)** in public subnets, pointing to ECS services running in private subnets.
- Everything managed via reusable **Terraform modules**.

---

## 📁 Folder Structure

```
terraform/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── README.md
└── modules/
    ├── vpc/
    ├── ecs/
    └── alb/
```

---

## 🛠️ Prerequisites

- An AWS account
- AWS CLI configured locally (`aws configure`)
- Terraform CLI installed (>= 1.0)
- Docker image of `SimpleTimeService` published to a public registry (e.g., DockerHub)

---

## 🔐 Authentication

This project assumes that **credentials are managed externally**, such as:
- `~/.aws/credentials` file
- AWS IAM Role (if using Cloud Shell, EC2, etc.)
- Environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`)

**DO NOT hardcode or commit secrets to source control!**

---

## 🚀 Deployment Instructions

1. **Clone the repo**  
```bash
git clone https://github.com/<your-username>/particle41-devops-team-challenge.git
cd particle41-devops-team-challenge/terraform
```

2. **Initialize Terraform**
```bash
terraform init
```

3. **Update the `terraform.tfvars` file**
```hcl
aws_region              = "us-east-1"
vpc_name                = "simpletime-vpc"
public_subnet_cidrs     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs    = ["10.0.3.0/24", "10.0.4.0/24"]
container_image         = "your-dockerhub-username/simpletimeservice:latest"
ecs_task_execution_role_arn = "arn:aws:iam::<account-id>:role/ecsTaskExecutionRole"
```

4. **Apply the Terraform plan**
```bash
terraform apply
```

5. **Access the service**  
Once completed, Terraform will output the **ALB DNS name**.  
Open it in your browser or run:
```bash
curl http://<alb_dns_name>
```

---

## 🧹 Cleanup

To tear down everything:
```bash
terraform destroy
```

---

## 📌 Notes

- The ECS service is configured to use **private subnets only**, ensuring security.
- The ALB is public and forwards HTTP requests to ECS tasks in private subnets.
- Ensure your Docker image is publicly accessible or hosted in ECR with the right permissions.

---

## 📞 Support

For any issues or help, feel free to reach out or open a GitHub issue.
