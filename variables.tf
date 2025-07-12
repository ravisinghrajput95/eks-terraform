variable "aws_region" {
  description = "AWS  region where all services will be provisioned"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name of AWS VPC"
  type        = string
  default     = "finops-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

}

variable "private_subnet" {
  description = "Prefix to be used for Private subnet name"
  type        = string
  default     = "Private"
}

variable "private_subnet_prefix" {
  description = "Prefix to be used for Private subnet name"
  type        = string
  default     = "Private"
}

variable "public_subnet_prefix" {
  description = "Prefix to be used for Public subnet name"
  type        = string
  default     = "Public"
}

variable "region" {
  description = "AWS region to deploy our resources"
  type        = string
  default     = "us-east-1"
}

variable "public_subnet_ids" {
  description = "public subnet where the bastion host will get provisioned"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
  default     = ""
}

variable "iam_role_arn" {
  description = "iam role"
  type        = string
  default     = ""
}

variable "environment" {
  description = "environment name"
  type        = string
  default     = "dev"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}