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

  is_directory_bucket = true
  bucket              = "my-awesome-private-s3-bucket"
  availability_zone_id = data.aws_availability_zones.available.zone_ids[1]
  server_side_encryption_configuration = {
    rule = {
      bucket_key_enabled = true # required for directory buckets
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.objects.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  lifecycle_rule = [
    {
      id     = "test"
      status = "Enabled"
      expiration = {
        days = 7
      }
    },
    {
      id     = "logs"
      status = "Enabled"
      expiration = {
        days = 5
      }
      filter = {
        prefix                = "logs/"
        object_size_less_than = 10
      }
    },
    {
      id     = "other"
      status = "Enabled"
      expiration = {
        days = 2
      }
      filter = {
        prefix = "other/"
      }
    }
  ]
  attach_policy = true
  policy        = data.aws_iam_policy_document.bucket_policy.json

  tags = {
    Service = "S3"
    Environment = "Dev"
  }
}

