# API Gateway

resource "aws_api_gateway_vpc_link" "poc" {
  name        = var.env_name
  target_arns = [aws_lb.poc.arn]

  tags = {
    Name = var.env_name
  }
}

resource "aws_api_gateway_rest_api" "poc" {
  name = var.env_name

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  tags = {
    Name = var.env_name
  }
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.poc.id
  parent_id   = aws_api_gateway_rest_api.poc.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id   = aws_api_gateway_rest_api.poc.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "ANY"
  authorization = "NONE"

  request_parameters = {
    "method.request.path.proxy" = true
  }
}

resource "aws_api_gateway_integration" "accounts_integration" {
  rest_api_id = aws_api_gateway_rest_api.poc.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.proxy.http_method

  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.poc.dns_name}/{proxy}"
  integration_http_method = "ANY"

  request_parameters = {
    "integration.request.path.proxy" = "method.request.path.proxy"
  }

  connection_type = "VPC_LINK"
  connection_id   = aws_api_gateway_vpc_link.poc.id
}

resource "aws_api_gateway_deployment" "v1" {
  depends_on = [aws_api_gateway_integration.accounts_integration]

  rest_api_id = aws_api_gateway_rest_api.poc.id
  stage_name  = "v1"

  lifecycle {
    create_before_destroy = true
  }
}
