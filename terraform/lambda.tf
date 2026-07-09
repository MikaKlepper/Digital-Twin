resource "aws_lambda_function" "api" {
  filename         = "${path.module}/../backend/lambda-deployment.zip"
  function_name    = local.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_handler.handler"
  source_code_hash = filebase64sha256("${path.module}/../backend/lambda-deployment.zip")
  runtime          = "python3.12"
  architectures    = ["x86_64"]
  timeout          = var.lambda_timeout
  tags             = local.common_tags

  environment {
    variables = {
      CORS_ORIGINS       = local.cors_origins
      DEFAULT_AWS_REGION = local.region
      S3_BUCKET          = aws_s3_bucket.memory.id
      USE_S3             = "true"
      BEDROCK_MODEL_ID   = var.bedrock_model_id
    }
  }

  depends_on = [aws_cloudfront_distribution.main]
}
