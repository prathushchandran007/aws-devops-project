resource "aws_lb_target_group" "app_tg" {
  name        = "devops-app-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  vpc_id = aws_vpc.main.id

  health_check {
    path     = "/"
    protocol = "HTTP"

    matcher = "200"
  }

  tags = {
    Name = "devops-app-tg"
  }
}
