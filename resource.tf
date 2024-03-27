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

data "aws_iam_role" "import_demo_function" {
  name = "import-demo-function-role-jekuqn1i"
}

resource "aws_cloudwatch_event_rule" "import_demo_function" {
  name = "codepipeline-MyDemo-master-543654-rule"

  event_pattern = <<PATTERN
{
  "source": ["aws.codecommit"],
  "detail-type": ["CodeCommit Repository State Change"],
  "resources": ["arn:aws:codecommit:ap-northeast-1:083636136646:MyDemoRepo"],
  "detail": {
    "event": ["referenceCreated", "referenceUpdated"],
    "referenceType": ["branch"],
    "referenceName": ["master"]
  }
}
PATTERN
}

resource "aws_lambda_function" "import_demo_function" {
  filename      = "./import_demo_function.zip"
  function_name = "import-demo-function"
  role          = data.aws_iam_role.import_demo_function.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
}

resource "aws_lambda_permission" "import_demo_function" {
  statement_id  = "AWSEvents_codepipeline-MyDemo-master-543654-rule_Id2bbd3deb-6ccc-4a64-bd40-33965589c604"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.import_demo_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.import_demo_function.arn
}

resource "aws_lambda_function" "import_demo_function_v2" {
  filename      = "./import_demo_function_v2.zip"
  function_name = "import-demo-function-v2"
  role          = data.aws_iam_role.import_demo_function.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
}

resource "aws_lambda_permission" "import_demo_function_v2" {
  statement_id  = "AWSEvents_codepipeline-MyDemo-master-543654-rule_Ida60db200-8a74-4641-aadf-0e66a1c76504"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.import_demo_function_v2.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.import_demo_function.arn
}
