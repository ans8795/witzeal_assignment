provider "aws" {
  region = var.region
}

resource "aws_lb" "alb" {
    name               = "witzeal-lb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [var.sg]
    subnets            = [var.subnet_id, var.subnet_id2]
}
# Create ALB target group
resource "aws_lb_target_group" "alb_tg" {
    name     = "witzeal-tg"
    port     = 80
    protocol = "HTTP"
    vpc_id   = var.vpc
 
    health_check {
    path                = "/"
    protocol            = "HTTP"
    timeout             = 10
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}
resource "aws_lb_listener" "alb_listner" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "alb_attach" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = module.ec2_instance.id
  port             = 8080
}

