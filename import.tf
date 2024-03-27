# import {
#   to = aws_lambda_function.slack_command_test_v1
#   id = "Slack-Command-Test-V1"
# }

# import {
#   to = aws_lambda_permission.slack_command_test_v1
#   id = "Slack-Command-Test-V1/FunctionURLAllowPublicAccess"
# }

import {
  to = aws_cloudwatch_event_rule.import_demo_function
  id = "default/codepipeline-MyDemo-master-543654-rule"
}

import {
  to = aws_lambda_function.import_demo_function
  id = "import-demo-function"
}

import {
  to = aws_lambda_permission.import_demo_function
  id = "import-demo-function/AWSEvents_codepipeline-MyDemo-master-543654-rule_Id2bbd3deb-6ccc-4a64-bd40-33965589c604"
}

import {
  to = aws_lambda_function.import_demo_function_v2
  id = "import-demo-function-v2"
}

import {
  to = aws_lambda_permission.import_demo_function_v2
  id = "import-demo-function-v2/AWSEvents_codepipeline-MyDemo-master-543654-rule_Ida60db200-8a74-4641-aadf-0e66a1c76504"
}
