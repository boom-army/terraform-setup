resource "aws_route53_zone" "main" {
  name = var.domain
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_cloudfront_distribution.s3_distribution.domain_name]
}

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain
  type    = "A"
  
  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "api" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_alb.alb.dns_name]
}

resource "aws_route53_record" "app" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "app"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_cloudfront_distribution.s3_distribution.domain_name]
}

resource "aws_route53_record" "docs" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "docs"
  type    = "CNAME"
  ttl     = "300"
  records = ["boom-army.github.io"]
}

resource "aws_route53_record" "meet" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "meet"
  type    = "A"
  ttl     = "300"
  records = ["54.191.254.144"]
}

resource "aws_route53_record" "mail_a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "mail"
  type    = "A"
  ttl     = "300"
  records = ["66.70.178.74"]
}

resource "aws_route53_record" "mail_mx" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain
  type    = "MX"
  ttl     = "300"
  records = ["10 mail.boom.army"]
}
