locals {
    terraform_state_bucket_name = "${var.project_name}-terraform-state-${data.aws_caller_identity.current.account_id}"
    terraform_locks_table_name = "${var.project_name}-terraform-locks"
    common_tags = {
        Name        = "Terraform State Store"
        Environment = "global"
        ManagedBy   = "terraform"
    }
}