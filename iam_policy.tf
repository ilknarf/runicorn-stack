# Use module to create IAM roles
module "db_put_policy" {
  source      = "github.com/ilknarf/terraform-dynamodb-iam-policy"
  name_prefix = "runicorn_db_put"
  description = "Put-only DynamoDB role"
  actions     = ["PutItem"]
}