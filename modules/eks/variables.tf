variable "vpc_id" {
  type = string
}

variable "vpc_name" {
  type    = string
  default = "finops-vpc"
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

}

variable "region" {
  description = "AWS region to deploy our resources"
  type        = string
  default     = "us-east-1"
}

variable "iam_role_arn" {
  description = "iam role"
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "name" {
  description = "Name of the StorageClass"
  type        = string
  default     = "gp3"
}

variable "volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

variable "fs_type" {
  description = "Filesystem type"
  type        = string
  default     = "ext4"
}

variable "reclaim_policy" {
  description = "Reclaim policy"
  type        = string
  default     = "Delete"
}

variable "volume_binding_mode" {
  description = "Volume binding mode"
  type        = string
  default     = "WaitForFirstConsumer"
}

variable "make_default" {
  description = "Whether to mark this StorageClass as default"
  type        = bool
  default     = true
}
