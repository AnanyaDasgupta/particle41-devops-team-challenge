region                  = "us-east-1"
project_name            = "simple-time-service"

vpc_cidr                = "10.0.0.0/16"
public_subnets          = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets         = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones      = ["us-east-1a", "us-east-1b"]

ecs_task_execution_role_name = "ecsTaskExecutionRole"
lb_sg_name             = "simple-time-service-alb-sg"

container_name          = "simple-time-service"
container_image         = "ananyadasgupta/simpletimeservice:latest"
container_port          = 5000
aws_account_id          = 940922024580
