locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.region

  aliases = var.use_custom_domain && var.root_domain != "" ? [
    var.root_domain,
    "www.${var.root_domain}",
  ] : []

  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }

  # all resource names
  frontend_bucket_name = "${local.name_prefix}-frontend-${local.account_id}"
  memory_bucket_name   = "${local.name_prefix}-memory-${local.account_id}"
  lambda_function_name = "${local.name_prefix}-api"
  lambda_role_name     = "${local.name_prefix}-lambda-role"
  api_gateway_name     = "${local.name_prefix}-api-gateway"

  # Lambda managed policies
  lambda_policy_arns = toset([
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::aws:policy/AmazonBedrockFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  ])

  # CORS origins for API Gateway and Lambda
  cors_origin_list = var.use_custom_domain ? [
    "https://${var.root_domain}",
    "https://www.${var.root_domain}",
    ] : [
    "https://${aws_cloudfront_distribution.main.domain_name}",
  ]

  cors_origins = join(",", local.cors_origin_list)

  api_gateway_routes = {
    get_root   = "GET /"
    post_chat  = "POST /chat"
    get_health = "GET /health"
  }
}
