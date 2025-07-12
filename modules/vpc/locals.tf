locals {
  name                 = var.vpc_name
  region               = var.aws_region
  environment          = "dev"
  public_subnet_count  = 2
  private_subnet_count = 2
  nat_gateway_count    = 1

  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnet_prefix = var.private_subnet_prefix
  public_subnet_prefix  = var.public_subnet_prefix
  tags = {
    Environment = local.environment
  }
}