/*
resource "aws_iam_role" "ssr_lambda" {
  name_prefix        = "runicorn-ssr-lambda-role"
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
  role       = aws_iam_role.ssr_lambda.name
  policy_arn = module.s3_static_read.arn
}
*/