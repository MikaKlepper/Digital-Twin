locals {
  terraform_state_bucket_name = "${var.project_name}-terraform-state-${data.aws_caller_identity.current.account_id}"
  terraform_locks_table_name  = "${var.project_name}-terraform-locks"
  common_tags = {
    Name        = "Terraform State Store"
    Environment = "global"
    ManagedBy   = "terraform"
  }

  github_actions_policy_arns = {
    lambda     = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
    s3         = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    apigateway = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
    cloudfront = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
    iam_read   = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
    bedrock    = "arn:aws:iam::aws:policy/AmazonBedrockFullAccess"
    dynamodb   = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
    acm        = "arn:aws:iam::aws:policy/AWSCertificateManagerFullAccess"
    route53    = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  }
}
