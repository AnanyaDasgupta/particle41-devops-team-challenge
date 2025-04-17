variable "vpc_id" {}
variable "private_subnet_ids" {
  type = list(string)
}

variable "cluster_name" {}
variable "container_name" {}
variable "container_image" {}
variable "container_port" {
  type = number
}

variable "alb_target_group_arn" {}
variable "alb_listener_arn" {}

variable "ecs_task_execution_role_arn" {}
