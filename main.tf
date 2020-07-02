terraform {
  backend "s3" {}
}

data "aws_caller_identity" "default" {}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_dynamodb_table" "run_data" {
  name         = "RunicornUserData"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "user_sub"
  range        = "created_at"

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