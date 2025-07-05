terraform {
  backend "s3" {
    bucket         = "terraform-state-dhirendra"        
    key            = "dev/terraform.tfstate"           
    region         = "eu-west-1"                       
    dynamodb_table = "terraform-locks"                 
  }
}
