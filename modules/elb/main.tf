variable "subnet_ids" {}
variable "env" {}

resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids

  tags = {
    Name = "app-elb"
    ENV  = var.env
  }
}
