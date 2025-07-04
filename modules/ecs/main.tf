variable "subnet_ids" {}
variable "env" {}

resource "aws_ecs_cluster" "app" {
  name = "ecs-cluster-${var.env}"
  tags = {
    ENV = var.env
  }
}

#resource "aws_ecs_task_definition" "app" {
#  family                   = "app-task"
 # requires_compatibilities = ["FARGATE"]
  #network_mode             = "awsvpc"
 # cpu                      = "256"
  #memory                   = "512"
 # container_definitions    = jsonencode([])
#}

resource "aws_ecs_task_definition" "app" {
  family                   = "app-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  container_definitions    = jsonencode([
    {
      name      = "sample"
      image     = "nginx"
      essential = true
      portMappings = [
        {
          containerPort = 80
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "app" {
  name            = "app-service"
  cluster         = aws_ecs_cluster.app.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    assign_public_ip = false
    security_groups  = []
  }

  tags = {
    ENV = var.env
  }
}
