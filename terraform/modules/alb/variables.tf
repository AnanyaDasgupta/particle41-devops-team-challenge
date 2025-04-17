variable "name" {
  description = "Project or ALB name"
  type        = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "lb_sg_id" {
  type = string
}

variable "target_port" {
  type    = number
  default = 5000
}
