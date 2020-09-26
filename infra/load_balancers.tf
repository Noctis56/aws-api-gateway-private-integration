# Load Balancers

resource "aws_lb" "poc" {
  name               = var.env_name
  internal           = true
  load_balancer_type = "network"

  subnet_mapping {
    subnet_id            = aws_subnet.private.id
    private_ipv4_address = var.nlb_private_ip
  }

  tags = {
    Name = var.env_name
  }
}

resource "aws_lb_listener" "poc" {
  load_balancer_arn = aws_lb.poc.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.poc.arn
  }
}

resource "aws_lb_target_group" "poc" {
  name        = var.env_name
  port        = var.app_listening_port
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.poc.id

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  tags = {
    Name = var.env_name
  }
}

resource "aws_lb_target_group_attachment" "poc" {
  target_group_arn = aws_lb_target_group.poc.arn
  target_id        = aws_instance.poc.private_ip
  port             = var.app_listening_port
}
