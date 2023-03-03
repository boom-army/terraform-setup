#Variables
variable "infrastructure_version" {
  default = "1"
}
variable "region" {
  default = "us-west-2"
}
variable "vpc_cidr" {
  description = "The CIDR Block for the SiteSeer VPC"
  default     = "10.0.0.0/16"
}

variable "rt_wide_route" {
  description = "Route in the SiteSeer Route Table"
  default     = "0.0.0.0/0"
}
variable "subnet_count" {
  description = "no of subnets"
  default     = 2
}
variable "availability_zones" {
  description = "availability zone to create subnet"
  default = [
    "us-west-2a",
    "us-west-2b"
  ]
}
variable "sosol_app_port" {
  description = "Port exposed by the sosol application"
  default     = 7777
}
variable "sosol_app_image" {
  description = "Dockerhub image for sosol-app"
  default     = "docker.io/sosol/terraform-sosol-backend:latest"
}
variable "sosol_app" {
  description = "sosol APP variable"
  default     = "app"
}
variable "sosol_env" {
  description = "sosol ENV variable"
  default     = "production"
}
variable "sosol_app_home" {
  description = "APP HOME variable"
  default     = "/usr/src/app/"
}
variable "sosol_app_name" {
  description = "Sosol app name"
  type        = string
  default     = "sosol-app"
}
variable "health_check_path" {
  description = "Http path for task health check"
  default     = "/.well-known/apollo/server-health"
}
variable "aws_key" {
  description = "AWS key for sosol"
  type        = string
  sensitive   = true
}
variable "aws_secret_key" {
  description = "AWS secret key for sosol"
  type        = string
  sensitive   = true
}
variable "aws_bucket" {
  description = "S3 bucket for content"
  default     = "sosol-prod"
}
variable "aws_bucket_name" {
  description = "S3 bucket for content"
  default     = "my.sosol.app"
}
variable "aws_bucket_new" {
  description = "S3 bucket for content"
  default     = "boom-army-prod"
}
variable "domain" {
  type        = string
  description = "The domain name to use for the sosol static site"
  default     = "boom.army"
}
variable "cloudflare_email" {
  type        = string
  description = "The email associated with the Cloudflare account"
  sensitive   = true
}
variable "cloudflare_api_token" {
  type        = string
  description = "The Cloudflare API Token"
  sensitive   = true
}
variable "cloudflare_api_key" {
  type        = string
  description = "The Cloudflare API Key"
  sensitive   = true
}
variable "onesignal_app_id" {
  type        = string
  description = "The OneSignal App ID"
  sensitive   = true
}
variable "onesignal_api_key" {
  type        = string
  description = "The OneSignal API Key"
  sensitive   = true
}
variable "sentry_dsn" {
  type        = string
  description = "The Sentry DSN"
  sensitive   = true
}
variable "cors_origin" {
  description = "CORS origin"
  default     = "https://app.boom.army"
}
variable "api_origin" {
  description = "CORS origin"
  default     = "https://api.boom.army"
}
variable "postgres_credentials" {
  type        = string
  description = "The psql URL"
  sensitive   = true
}
variable "postgres_endpoint" {
  type        = string
  description = "The psql URL"
  default = "159.223.192.147:5432"
}
variable "postgres_db_name" {
  type        = string
  description = "The psql URL"
  default = "sosol_postgresdb_prod"
}
variable "backend_node_count" {
  type        = number
  description = "The number of backend containers to run"
  default = 2
}
