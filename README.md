#Provision EKS with Terraform, estimate cost with Infracost and governance with Cloud custodian

Provision and manage an Amazon EKS (Elastic Kubernetes Service) cluster using Terraform. This repo helps you automate the deployment of a production-ready Kubernetes environment on AWS.

## Features

- EKS cluster setup using Terraform
- Node group provisioning
- IAM roles and policies
- VPC and networking configuration
- Modular design (supports customization)
- Outputs for kubeconfig and cluster details

## Folder Structure

```bash
.
├── data.tf                   # Root-level data sources
├── ingress.yaml              # Sample Kubernetes ingress manifest
├── locals.tf                 # Root-level local variables
├── main.tf                   # Main Terraform configuration
├── outputs.tf                # Outputs from the root module
├── provider.tf               # Provider definitions
├── terraform.tfvars          # Variable values
├── variables.tf              # Root-level input variables
├── stop-unused-ec2.yml       # GitHub Action to stop unused EC2s
├── modules/                  # Terraform modules
│   ├── eks/                  # EKS module
│   │   ├── data.tf
│   │   ├── locals.tf
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── provider.tf
│   │   └── variables.tf
│   └── vpc/                  # VPC module
│       ├── data.tf
│       ├── locals.tf
│       ├── main.tf
│       ├── output.tf
│       ├── provider.tf
│       └── variables.tf
├── .github/
│   └── workflows/
│       └── infracost.yml     # Infracost GitHub Action workflow
└── README.md

```

## Getting Started

### Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform v1.3+ installed
- IAM user/role with required EKS and VPC permissions

### Steps

```bash
# 1. Initialize Terraform
terraform init

# 2. Preview changes
terraform plan

# 3. Apply and create infrastructure
terraform apply

# 4. Connect to the EKS cluster (after successful apply)
aws eks update-kubeconfig --region <your-region> --name <cluster-name>
```

## Validate Setup

```bash
kubectl get nodes
kubectl get svc
```
## 📎 Customization

- Modify `variables.tf` to change cluster name, region, node size, etc.
- You can plug in additional modules (e.g., for monitoring or storage).

---

## Clean Up

```bash
terraform destroy
```

## Cost Visibility with Infracost
This repo includes Infracost GitHub Actions to automatically calculate the cost of infrastructure changes in pull requests.



