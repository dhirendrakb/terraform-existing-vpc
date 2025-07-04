module "test_ecs" {
  source     = "../modules/ecs"
  subnet_ids = ["subnet-111", "subnet-222"]
  env        = "test"
}
