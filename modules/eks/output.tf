output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "access_entries" {
  value = module.eks.access_entries
}

output "kubeconfig" {
  description = "Kubeconfig file for accessing the EKS cluster"
  value       = <<-EOF
    apiVersion: v1
    clusters:
    - cluster:
        server: "https://${module.eks.cluster_endpoint}"
        certificate-authority-data: "${module.eks.cluster_certificate_authority_data}"
      name: "${local.name}"
    contexts:
    - context:
        cluster: "${local.name}"
        user: "${local.name}"
      name: "${local.name}"
    current-context: "${local.name}"
    kind: Config
    preferences: {}
    users:
    - name: "${local.name}"
      user:
        exec:
          apiVersion: client.authentication.k8s.io/v1alpha1
          args:
          - "token"
          - "-i"
          - "${local.name}"
          command: "aws"
          env: null
    EOF
}

output "storage_class_name" {
  description = "The name of the storage class created"
  value       = kubernetes_storage_class.this.metadata[0].name
}