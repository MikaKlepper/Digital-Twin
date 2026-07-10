variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "twin"
}

variable "enable_github_oidc" {
  description = "Create the GitHub Actions OIDC provider and deploy role"
  type        = bool
  default     = false
}

variable "github_repository" {
  description = "GitHub repository in format 'owner/repo'"
  type        = string
  default     = ""

  validation {
    condition     = var.github_repository == "" || can(regex("^[^/]+/[^/]+$", var.github_repository))
    error_message = "GitHub repository must use the format 'owner/repo'."
  }
}
