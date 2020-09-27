# Cognito

resource "aws_cognito_user_pool" "poc" {
  name = "poc"

  tags = {
    Name = var.env_name
  }
}

resource "aws_cognito_user_pool_client" "poc" {
  name         = "poc"
  user_pool_id = aws_cognito_user_pool.poc.id

  callback_urls = ["https://www.google.com/"]

  allowed_oauth_flows_user_pool_client = true
  supported_identity_providers         = ["COGNITO"]
  explicit_auth_flows                  = ["ALLOW_CUSTOM_AUTH", "ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_SRP_AUTH"]

  allowed_oauth_flows  = ["implicit"]
  allowed_oauth_scopes = ["openid"]

  prevent_user_existence_errors = "ENABLED"
}

resource "aws_cognito_user_pool_domain" "poc" {
  domain       = "poc-apg"
  user_pool_id = aws_cognito_user_pool.poc.id
}
