terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = local.name_prefix
  cidr = var.vpc_cidr

  azs             = ["${local.aws_region}a", "${local.aws_region}b"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  tags                 = local.tags
}