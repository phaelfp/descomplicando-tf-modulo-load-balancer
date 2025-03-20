data "aws_security_group" "existing_sg" {
  filter {
    name   = "tag:Name"
    values = [var.sg_name]
  }
}

resource "aws_lb" "main" {
  name               = "meu-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.existing_sg.id]
  subnets            = var.subnets
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.cert_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}

resource "aws_lb_target_group" "app" {
  name     = "app-target-group"
  port     = var.target_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
