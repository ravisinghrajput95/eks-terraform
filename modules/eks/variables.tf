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