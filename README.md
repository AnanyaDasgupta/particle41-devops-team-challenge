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
