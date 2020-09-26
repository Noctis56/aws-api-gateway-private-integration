# Instance

resource "aws_instance" "poc" {
  ami = var.ami

  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.poc.id]

  instance_type = var.instance_type

  user_data = data.template_file.user_data.rendered

  tags = {
    Name = var.env_name
  }
}

resource "aws_eip" "poc" {
  instance = aws_instance.poc.id
  vpc      = true

  tags = {
    Name = var.env_name
  }
}
