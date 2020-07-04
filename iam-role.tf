resource "aws_iam_role_policy_attachment" "ssr_attach" {
  role = aws_iam_role.ssr_lambda.name
  policy_arn = module.s3_static_read.arn
}