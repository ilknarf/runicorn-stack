# Static site files
resource "aws_s3_bucket" "static_assets" {
  bucket_prefix = "runicorn-static-assets-${data.aws_caller_identity.default.account_id}"
}