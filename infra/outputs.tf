# Outputs

output "cognito_endpoint" {
  description = "The endpoint name of the user pool"
  value       = aws_cognito_user_pool.poc.endpoint
}

output "api_invoke_url" {
  description = "The URL to invoke the API pointing to the stage"
  value       = aws_api_gateway_deployment.v1.invoke_url
}

output "nlb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.poc.dns_name
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.poc.id
}

output "subnet_public_ids" {
  description = "The list of the public subnet IDs"
  value       = [aws_subnet.public.id]
}

output "subnet_private_ids" {
  description = "The list of the private subnet IDs"
  value       = [aws_subnet.private.id]
}

output "security_group_poc_id" {
  description = "The ID of the security group for POC"
  value       = aws_security_group.poc.id
}
