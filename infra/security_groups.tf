# Security Groups

resource "aws_security_group" "poc" {
  name        = var.env_name
  description = "Allow IP for POC"
  vpc_id      = aws_vpc.poc.id

  ingress {
    description = "Listening port"
    from_port   = var.app_listening_port
    to_port     = var.app_listening_port
    protocol    = "tcp"
    cidr_blocks = ["${var.nlb_private_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.env_name
  }
}
