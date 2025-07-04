variable "subnet_ids" {}
variable "env" {}

resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    ENV = var.env
  }
}

resource "aws_rds_cluster" "app" {
  cluster_identifier      = "rds-cluster"
  engine                  = "aurora-mysql"
  master_username         = "admin"
  master_password         = "password123"
  db_subnet_group_name    = aws_db_subnet_group.rds.name
  skip_final_snapshot     = true
  tags = {
    ENV = var.env
  }
}
