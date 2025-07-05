

module "subnets" {
  source    = "./modules/subnets"
  vpc_id    = data.aws_vpc.existing.id
  vpc_cidr  = data.aws_vpc.existing.cidr_block
  env       = var.env
}

module "elb" {
  source     = "./modules/elb"
  subnet_ids = module.subnets.public_subnet_ids
  env        = var.env
}

module "s3" {
  source = "./modules/s3"
  env    = var.env
}

module "ecs" {
  source     = "./modules/ecs"
  subnet_ids = module.subnets.private_subnet_ids
  env        = var.env
}

module "redis" {
  source     = "./modules/redis"
  subnet_ids = module.subnets.private_subnet_ids
  env        = var.env
}

module "rds" {
  source     = "./modules/rds"
  subnet_ids = module.subnets.private_subnet_ids
  env        = var.env
  secret_name = "rds-master-credentials"  # replace with your actual secret name
}
resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.existing.id

  tags = {
    Name = "igw-${var.env}"
    ENV  = var.env
  }
}
