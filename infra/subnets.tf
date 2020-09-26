# Subnets

## VPC

resource "aws_vpc" "poc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true

  tags = {
    Name = var.env_name
  }
}

## Public

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.poc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "${var.env_name}-public"
  }
}

## Private

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.poc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.env_name}-private"
  }
}
