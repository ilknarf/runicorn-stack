/*
resource "aws_cloudfront_distribution" {
  origin {
    domain_name = aws_s3_bucket.static_assets.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
  }
}
*/