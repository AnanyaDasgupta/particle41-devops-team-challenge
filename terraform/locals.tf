locals {
  aws_region   = "us-east-1"
  name_prefix  = "${var.project_name}-${var.environment}"

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}