variable "subnet_ids" {}
variable "env" {}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "redis-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  #parameter_group_name = "default.redis6.x"
  parameter_group_name = "default.redis7"
  tags = {
    ENV = var.env
  }
}
