data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::my-awesome-private-s3-bucket/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}