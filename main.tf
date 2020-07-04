terraform {
  backend "s3" {}
}

data "aws_caller_identity" "default" {}

provider "aws" {
  profile = "default"
  region  = var.region
}

# Provision DynamoDB table
resource "aws_dynamodb_table" "run_data" {
  name         = "RunicornUserData"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "user_sub"
  range_key    = "created_at"

  attribute {
    name = "user_sub"
    type = "S"
  }

  attribute {
    name = "created_at"
    type = "N"
  }

  attribute {
    name = "distance"
    type = "N"
  }

  local_secondary_index {
    name            = "distance-index"
    range_key       = "distance"
    projection_type = "ALL"
  }
}

resource "aws_s3_bucket" "static_assets" {
  bucket_prefix = "runicorn-static-assets-${data.aws_caller_identity.default.account_id}"
}

resource "aws_iam_role" "ssr_lambda" {
  name_prefix = "runicorn-ssr-lambda-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ssr_attach" {
  role = aws_iam_role.ssr_lambda.name
  policy_arn = module.s3_static_read.arn
}