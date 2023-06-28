resource "aws_secretsmanager_secret" "boom_ssl_pem" {
  name        = "boom-ssl-pem"
  description = "SSL PEM for the Boom service"

  tags = {
    Environment = "Production"
  }
}

resource "aws_secretsmanager_secret" "boom_ssl_key" {
  name        = "boom-ssl-key"
  description = "SSL Key for the Boom service"

  tags = {
    Environment = "Production"
  }
}

resource "aws_secretsmanager_secret_version" "boom_ssl_pem_version" {
  secret_id     = aws_secretsmanager_secret.boom_ssl_pem.id
  secret_string = file(var.pem_cert)
}

resource "aws_secretsmanager_secret_version" "boom_ssl_key_version" {
  secret_id     = aws_secretsmanager_secret.boom_ssl_key.id
  secret_string = file(var.pem_key)
}
