variable "subnet_ids" {}
variable "env" {}
variable "secret_name" {
  description = "Secrets Manager secret name for RDS credentials"
  type        = string
}


resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    ENV = var.env
  }
}





data "aws_secretsmanager_secret" "rds_secret" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id = data.aws_secretsmanager_secret.rds_secret.id
}

locals {
  credentials = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_version.secret_string)
}

resource "aws_rds_cluster" "app" {
  cluster_identifier      = "rds-cluster"
  engine                  = "aurora-mysql"
  master_username         = local.credentials.username
  master_password         = local.credentials.password
  db_subnet_group_name    = aws_db_subnet_group.rds.name
  skip_final_snapshot     = true
  tags = {
    ENV = var.env
  }
}
