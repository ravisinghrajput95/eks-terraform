module "vpc" {
  source      = "./modules/vpc"
  environment = var.environment
  vpc_cidr    = var.vpc_cidr
}

module "eks" {
  source             = "./modules/eks"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_cidr           = var.vpc_cidr
  aws_account_id     = var.aws_account_id
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket              = "my-awesome-private-s3-bucket"

  tags = {
    Service = "S3"
    Environment = "Dev"
  }
}
