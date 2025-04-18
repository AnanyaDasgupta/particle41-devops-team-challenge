# 📦 SimpleTimeService — ECS Fargate Deployment with Terraform

This project demonstrates how to deploy a containerized application on **AWS ECS Fargate** using **Terraform**, following production-ready best practices.

It deploys:
- A container (`ananyadasgupta/simpletimeservice:latest`)
- An ECS Fargate service behind an ALB
- A VPC with public and private subnets
- Autoscaling based on CPU utilization
- Secure IAM roles and networking setup

---

## 🧭 Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Customization](#customization)
- [File Structure](#file-structure)
- [Security Groups](#security-groups)
- [Auto Scaling](#auto-scaling)
- [Cleanup](#cleanup)
- [FAQ](#faq)
- [License](#license)

---

## 🚀 Features

✅ Infrastructure as Code with Terraform  
✅ VPC with private/public subnets  
✅ ECS Fargate service with ALB  
✅ Load-balanced, scalable container app  
✅ Secure IAM roles and security groups  
✅ Auto scaling on CPU usage  
✅ Easy customization via variables

---

## 🏗️ Architecture

```
                +--------------------------+
                |     Internet / Users     |
                +-----------+--------------+
                            |
                    +-------v--------+
                    |   ALB (Public) |
                    +-------+--------+
                            |
                    +-------v--------+
                    |  ECS Fargate   |
                    |  (Private SG)  |
                    +-------+--------+
                            |
                    +-------v--------+
                    |  VPC + Subnets |
                    +----------------+
```

- ALB: Publicly accessible, routes HTTP requests
- ECS: Runs container in private subnets
- Logs and metrics available via CloudWatch

---

## ✅ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- AWS IAM credentials configured (`aws configure`)

---

## ⚙️ Usage

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/simpletimeservice-ecs.git
cd simpletimeservice-ecs
```

### 2. Configure Variables

Edit `terraform.tfvars`:

```hcl
project_name     = "simpletimeservice"
container_image  = "ananyadasgupta/simpletimeservice:latest"
container_port   = 5000

public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review and Deploy

```bash
terraform plan
terraform apply
```

Confirm with `yes` when prompted.

---

## 🌐 Access the App

After deployment, Terraform will output:

```
Outputs:
alb_dns_name = http://<your-alb-dns>
```

Open this URL in your browser to access the app.

---

## 🛠️ Customization

You can adjust settings in `terraform.tfvars` or via CLI:

| Variable           | Description                            | Default     |
|--------------------|----------------------------------------|-------------|
| `project_name`     | Name of the project                    | -           |
| `container_image`  | Docker image for the app               | -           |
| `container_port`   | Port the app listens on inside container | 5000      |
| `cpu`              | Task CPU units                         | 256         |
| `memory`           | Task memory in MB                      | 512         |
| `vpc_cidr`         | VPC CIDR block                         | 10.0.0.0/16 |

---

## 📁 File Structure

```
.
├── main.tf              # Provider and VPC module
├── ecs.tf               # ECS Cluster, Task, Service
├── alb.tf               # ALB and Listener setup
├── security.tf          # Security Groups
├── autoscaling.tf       # Auto scaling setup
├── iam.tf               # IAM roles for ECS tasks
├── locals.tf            # Local variables and tags
├── variables.tf         # Input variable definitions
├── terraform.tfvars     # Actual values for deployment
├── outputs.tf           # ALB DNS output
```

---

## 🔐 Security Groups

- **ALB SG**: Allows HTTP (80) from internet
- **ECS Task SG**: Only accepts traffic from ALB SG
- **Egress**: Open to all for both (can be locked down further)

---

## 📈 Auto Scaling

Configured using `aws_appautoscaling_target` and a CPU-based policy:

- Target: 50% average CPU
- Min tasks: 1
- Max tasks: 4
- Cooldowns: 60s

Scaling is triggered automatically by ECS CloudWatch metrics.

---

## 🧹 Cleanup

To destroy the infrastructure:

```bash
terraform destroy
```

---

By following these steps, you'll have a safe and consistent Terraform environment for managing the infrastructure for SimpleTimeService.

## ❓ FAQ

**Q:** Why does my service show a timeout?  
➡️ Check if ECS tasks are healthy and running  
➡️ Ensure the app listens on `0.0.0.0:<port>`, not just `localhost`  

**Q:** No logs in CloudWatch?  
➡️ Ensure ECS task uses the default logging driver  
➡️ You can view logs via the AWS Console → ECS → Task → Logs tab

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
