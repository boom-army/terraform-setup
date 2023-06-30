data "cloudflare_zones" "domain" {
  filter {
    name = var.domain
  }
}

resource "cloudflare_record" "site_cname" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "app"
  value   = aws_s3_bucket.app.bucket_regional_domain_name
  type    = "CNAME"

  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "api_cname" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "api"
  value   = aws_alb.alb.dns_name
  type    = "CNAME"

  ttl     = 1
  proxied = true
}

resource "cloudflare_page_rule" "https" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  target  = "*.${var.domain}/*"
  actions {
    always_use_https = true
  }
}

# resource "cloudflare_record" "site_cname" {
#   zone_id = data.cloudflare_zones.domain.zones[0].id
#   name    = var.domain
#   value   = aws_s3_bucket.site.website_endpoint
#   type    = "CNAME"

#   ttl     = 1
#   proxied = true
# }

# resource "cloudflare_record" "www" {
#   zone_id = data.cloudflare_zones.domain.zones[0].id
#   name    = "www"
#   value   = var.domain
#   type    = "CNAME"

#   ttl     = 1
#   proxied = true
# }

