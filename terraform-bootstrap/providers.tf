provider "aws" {
  # Uses AWS CLI configuration (aws configure)
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}