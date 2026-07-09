# IAM role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = local.lambda_role_name
  tags = local.common_tags

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

# Lambda role policies: logging, Bedrock, and S3
resource "aws_iam_role_policy_attachment" "lambda" {
  for_each = local.lambda_policy_arns

  policy_arn = each.value
  role       = aws_iam_role.lambda_role.name
}
