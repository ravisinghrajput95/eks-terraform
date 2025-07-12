locals {
  name                = "finops-demo-cluster"
  cluster_version     = "1.32"
  vpc_cidr            = var.vpc_cidr
  azs                 = slice(data.aws_availability_zones.available.names, 0, 3)
  instance_size       = "t2.medium"
  authentication_mode = "API_AND_CONFIG_MAP"
  ami_type            = "AL2_x86_64"
  capacity_type       = "ON_DEMAND"
  desired_size        = 2
  max_size            = 6
  min_size            = 2
  role_name_prefix    = "VPC-CNI-IRSA"
  policy_arn          = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  type                = "cluster"

  tags = {
    Name = local.name
  }
}