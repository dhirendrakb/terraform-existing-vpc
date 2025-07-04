provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "existing" {
  filter {
    name   = "tag:ENV"
    values = ["DEV"]
  }

  filter {
    name   = "tag:PROJ"
    values = ["MyProj"]
  }
}
