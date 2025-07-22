terraform {
  required_version = ">= 1.3.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.95.0, < 6.0.0"
    }
  }

  backend "s3" {
    bucket         = "finops-eks-terraform-backend"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "finops-eks-terraform-backend"
  }
}

provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  config_path            = "~/.kube/config"
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  
}