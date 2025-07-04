
module "test_subnets" {
  source   = "../modules/subnets"
  vpc_cidr = "172.16.0.0/20"
  vpc_id   = "vpc-123456"
  env      = "test"
}

output "test_public_subnets" {
  value = module.test_subnets.public_subnet_ids
}

output "test_private_subnets" {
  value = module.test_subnets.private_subnet_ids
}
