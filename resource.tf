resource "aws_secretsmanager_secret" "test20240226" {
  name                           = "test20240226"
  description                    = "test20240226"
  force_overwrite_replica_secret = false
  recovery_window_in_days        = 30
  tags = {
    Name = "test20240226"
  }
}

data "aws_iam_role" "slack_command_test_v1" {
  name = "Slack-Command-Test-V1-role-ognoa7lj"
}

resource "aws_lambda_function" "slack_command_test_v1" {
  filename      = "./lambda_function_payload.zip"
  function_name = "Slack-Command-Test-V1"
  role          = data.aws_iam_role.slack_command_test_v1.arn
  handler       = "lambda_function.handler"
  runtime       = "python3.12"

  tags = {
    Name = "Slack-Command-Test-V1"
  }
}

resource "aws_lambda_permission" "slack_command_test_v1" {
  statement_id           = "FunctionURLAllowPublicAccess"
  action                 = "lambda:InvokeFunctionUrl"
  function_name          = aws_lambda_function.slack_command_test_v1.function_name
  principal              = "*"
  function_url_auth_type = "NONE"
}
