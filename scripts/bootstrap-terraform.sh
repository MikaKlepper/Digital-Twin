#!/bin/bash
set -e 

PROJECT_NAME=${1:-twin}
AWS_REGION=${2:-eu-north-1} 

echo "🚀 Bootstrapping Terraform backend for project '${PROJECT_NAME}'..."

# Navigate to bootstrap Terraform project
cd "$(dirname "$0")/../terraform-bootstrap"

# Initialize Terraform
echo "🔧 Initializing Terraform..."
terraform init

# Apply bootstrap infrastructure
echo "📦 Creating Terraform backend resources..."
terraform apply \
  -var="project_name=${PROJECT_NAME}" \
  -var="aws_region=${AWS_REGION}" \
  -auto-approve

echo ""
echo "✅ Terraform backend successfully created!"
echo ""

# Show outputs
terraform output

echo ""
echo "🎉 Backend is ready."
echo ""
