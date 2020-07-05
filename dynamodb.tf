# Provision DynamoDB table for user run data
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