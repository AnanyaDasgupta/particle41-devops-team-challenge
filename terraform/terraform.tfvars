project_name     = "simpletimeservice"
container_image  = "ananyadasgupta/simpletimeservice:latest"

public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
container_port   = 5000