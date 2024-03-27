resource "aws_secretsmanager_secret" "test20240226" {
  name                           = "test20240226"
  description                    = "test20240226"
  force_overwrite_replica_secret = false
  recovery_window_in_days        = 30
  tags = {
    Name = "test20240226"
  }
}
