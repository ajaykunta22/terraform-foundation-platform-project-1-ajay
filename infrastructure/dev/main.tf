locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
    CostCenter  = "Bootcamp"
  }
}

module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones

  common_tags = local.common_tags
}
module "s3" {
  source = "../../modules/s3"

  project_name = var.project_name
  environment  = var.environment

  common_tags = local.common_tags
}
module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment

  common_tags = local.common_tags
}
module "ec2" {
  source = "../../modules/ec2"

  project_name = var.project_name
  environment  = var.environment

  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_ids[0]
  instance_profile_name = module.iam.ec2_instance_profile_name

  common_tags = local.common_tags
}