# need to use a placeholder zip in order to deploy lambda
data "archive_file" "placeholder" {
  type = "zip"
  output_path = "${path.root}/lambda_placeholder.zip"

  source {
    content = "lorem ipsum"
    filename = "placeholder.txt"
  }
}

resource "aws_lambda_function" "ssr_lambda" {
  filename = data.archive_file.placeholder.output_path
  function_name = "runicorn-ssr-react"
  role = aws_iam_role.ssr_lambda.arn
  handler = "placeholder.handler"

  runtime = "nodejs12.x"
}