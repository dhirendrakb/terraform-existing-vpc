module "test_rds" {
  source     = "../modules/rds"
  subnet_ids = ["subnet-111", "subnet-222"]
  env        = "test"
}