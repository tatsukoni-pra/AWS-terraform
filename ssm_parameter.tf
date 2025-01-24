resource "aws_ssm_parameter" "test1" {
  name        = "/rds/db/test1"
  description = "/rds/db/test1"
  type        = "SecureString"
  value       = "testValue1"

  tags = {
    Name = "rds/db/test1"
  }
}

data "aws_security_group" "aurora-sg" {
  name = "aurora-sg"
}

resource "aws_ssm_parameter" "test2" {
  name        = "/rds/db/test2"
  description = "/rds/db/test2"
  type        = "SecureString"
  value       = data.aws_security_group.aurora-sg.id

  tags = {
    Name = "rds/db/test2"
  }
}
