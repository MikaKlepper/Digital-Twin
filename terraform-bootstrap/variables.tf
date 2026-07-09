variable "aws_region" {
    description = "AWS region"
    type        = string
    default     = "us-east-1"
}

variable "project_name" {
    description = "Name prefix for all resources"
    type        = string
    default     = "twin"
}