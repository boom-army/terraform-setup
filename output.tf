output "postgres_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

output "alb_dns_name" {
  value = aws_alb.alb.dns_name
}

output "jwt_secret" {
  value = replace(random_string.sosol_secret_key.result, "\"", "")
}

output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.app.id
}

output "bucket_endpoint" {
  description = "Bucket endpoint"
  value       = aws_s3_bucket.app.website_endpoint
}

output "domain_name" {
  description = "Website endpoint"
  value       = var.domain
}
