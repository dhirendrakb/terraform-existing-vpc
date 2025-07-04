variable "env" {}

#resource "aws_s3_bucket" "shared" {
  #bucket = "shared-bucket-${var.env}"
#  bucket = "shared-bucket-${lower(var.env)}"

 # tags = {
 #   ENV = var.env
 # }
#}

resource "aws_s3_bucket" "shared" {
  bucket = "shared-bucket-${lower(var.env)}-${random_id.suffix.hex}"

  tags = {
    ENV = var.env
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}
