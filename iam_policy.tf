# Use module to create IAM roles
/*
module "db_put_policy" {
  source      = "github.com/ilknarf/terraform-iam-policy"
  name_prefix = "runicorn_db_put"
  description = "Put-only DynamoDB role"
  actions     = ["dynamodb:PutItem"]
  db_arn      = aws_dynamodb_table.run_data.arn
}

module "s3_static_read" {
  source      = "github.com/ilknarf/terraform-iam-policy"
  name_prefix = "runicorn_static_s3_read"
  description = "Read role to serve static s3 assets"
  actions     = ["s3:GetObject"]
  db_arn      = "${aws_s3_bucket.static_assets.arn}/static/*"
}
*/