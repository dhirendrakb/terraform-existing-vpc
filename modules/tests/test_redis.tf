module "test_redis" {
  source     = "../modules/redis"
  subnet_ids = ["subnet-111", "subnet-222"]
  env        = "test"
}