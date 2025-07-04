
resource "aws_subnet" "public_1" {
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, 0)
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
    ENV  = var.env
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, 1)
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
    ENV  = var.env
  }
}

resource "aws_subnet" "private_1" {
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, 2)
  availability_zone = "eu-west-1a"

  tags = {
    Name = "private-subnet-1"
    ENV  = var.env
  }
}

resource "aws_subnet" "private_2" {
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, 3)
  availability_zone = "eu-west-1b"

  tags = {
    Name = "private-subnet-2"
    ENV  = var.env
  }
}