output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "public_route_table_ids" {
  value = module.vpc.public_route_table_ids
}

output "private_route_table_ids" {
  value = module.vpc.private_route_table_ids
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "public_subnet_arns" {
  value = module.vpc.public_subnet_arns
}

output "public_subnets_cidr_blocks" {
  value = module.vpc.public_subnets_cidr_blocks
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "private_subnet_arns" {
  value = module.vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "kubeconfig" {
  description = "Kubeconfig file for accessing the EKS cluster"
  value       = <<-EOF
    apiVersion: v1
    clusters:
    - cluster:
        server: "https://${module.eks.cluster_endpoint}"
        certificate-authority-data: "${module.eks.cluster_certificate_authority_data}"
      name: "${local.name}-${var.environment}"
    contexts:
    - context:
        cluster: "${local.name}-${var.environment}"
        user: "${local.name}-${var.environment}"
      name: "${local.name}-${var.environment}"
    current-context: "${local.name}-${var.environment}"
    kind: Config
    preferences: {}
    users:
    - name: "${local.name}-${var.environment}"
      user:
        exec:
          apiVersion: client.authentication.k8s.io/v1alpha1
          args:
          - "token"
          - "-i"
          - "${local.name}-${var.environment}"
          command: "aws"
          env: null
    EOF
}