provider "aws" {
  region = var.region
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  availability_zones  = var.availability_zones
  project_name        = var.project_name
}

module "alb" {
  source            = "./modules/alb"
  name              = var.project_name
  public_subnet_ids = module.vpc.public_subnet_ids
  vpc_id            = module.vpc.vpc_id
  lb_sg_id          = data.aws_security_group.lb_sg.id
  target_port       = var.container_port
}

module "ecs" {
  source                  = "./modules/ecs"
  vpc_id                  = module.vpc.vpc_id
  private_subnet_ids      = module.vpc.private_subnet_ids
  cluster_name            = var.project_name
  container_name          = var.container_name
  container_image         = var.container_image
  container_port          = var.container_port
  alb_target_group_arn    = module.alb.target_group_arn
  alb_listener_arn        = module.alb.listener_arn
  ecs_task_execution_role_arn = data.aws_iam_role.ecs_task_exec.arn
}

data "aws_iam_role" "ecs_task_exec" {
  name = var.ecs_task_execution_role_name
}

data "aws_security_group" "lb_sg" {
  name   = var.lb_sg_name
  vpc_id = module.vpc.vpc_id
}
