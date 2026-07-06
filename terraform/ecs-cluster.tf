resource "aws_ecs_cluster" "main" {
  name = "aws-devops-cluster"

  tags = {
    Name = "aws-devops-cluster"
  }
}
