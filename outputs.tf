output "vpc_id" {
  value = data.aws_vpc.existing.id
}

output "vpc_cidr" {
  value = data.aws_vpc.existing.cidr_block
}

output "public_subnets" {
  value = module.subnets.public_subnet_ids
}

output "private_subnets" {
  value = module.subnets.private_subnet_ids
}
