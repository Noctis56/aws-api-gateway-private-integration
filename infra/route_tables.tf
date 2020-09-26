# Route Tables

## Public

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.poc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.poc.id
  }

  tags = {
    Name = "${var.env_name}-public"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

## Private

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.poc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.poc.id
  }

  tags = {
    Name = "${var.env_name}-private"
  }
}

resource "aws_main_route_table_association" "private" {
  vpc_id         = aws_vpc.poc.id
  route_table_id = aws_route_table.private.id
}

## Gateways

resource "aws_internet_gateway" "poc" {
  vpc_id = aws_vpc.poc.id

  tags = {
    Name = var.env_name
  }
}

resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "${var.env_name}-nat"
  }
}

resource "aws_nat_gateway" "poc" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = var.env_name
  }
}
