variable "region" {
    description = "AWS region to deploy resources in"
    type        = string
    default     = "us-east-1"
}
variable "project_name" {}

variable "vpc_cidr" {}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}

variable "ecs_task_execution_role_name" {}
variable "lb_sg_name" {}

variable "container_name" {}
variable "container_image" {}
variable "container_port" {
  type = number
}

variable "aws_account_id" {
  type = any 
}
