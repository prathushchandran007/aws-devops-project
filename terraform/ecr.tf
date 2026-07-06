resource "aws_ecr_repository" "app_repo" {
  name = "aws-devops-project"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "aws-devops-project"
  }
}
