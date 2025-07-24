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

resource "aws_kms_key" "objects" {
  description             = "KMS key for S3 bucket objects"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.1"
  bucket              = "my-awesome-private-s3-bucket"
  block_public_policy = false
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
    },

    {
      id  = "upload"
      enabled  = true
      abort_incomplete_multipart_upload_days = 7
    } 
  ]
  attach_policy = true
  policy        = data.aws_iam_policy_document.bucket_policy.json

  tags = {
    Service = "S3"
    Environment = "Dev"
  }
}
