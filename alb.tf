resource "aws_lb" "lb" {
  name               = "ka_lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.private_subnet_main, aws_subnet.private_subnet_second, aws_subnet.public_subnet_main, aws_subnet.public_subnet_second]
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "lbtg" {
  name     = "ka_lbtg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main_vpc.id
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lbtg.arn
  }
}