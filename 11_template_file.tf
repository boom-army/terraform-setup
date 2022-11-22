data "template_file" "task_definition_template" {
  template = file("task_definition.json.tpl")
  vars = {
    AWS_ACCESS_KEY_ID = var.aws_key
    AWS_BUCKET_NAME   = var.aws_bucket
    AWS_REGION        = var.region
    AWS_SECRET_KEY    = var.aws_secret_key
    CLOUDWATCH_GROUP  = aws_cloudwatch_log_group.logs.name
    DATABASE_URL      = "postgresql://${var.postgres_credentials}@${var.postgres_endpoint}/${var.postgres_db_name}?schema=public&connection_limit=10&pool_timeout=120"
    JWT_SECRET        = replace(random_string.sosol_secret_key.result, "\"", "")
    NODE_ENV          = var.sosol_env
    SOSOL_PORT        = var.sosol_app_port
    REPOSITORY_URL    = var.sosol_app_image
    SOSOL_APP         = var.sosol_app
    SOSOL_APP_HOME    = var.sosol_app_home
    ONESIGNAL_APP_ID  = var.onesignal_app_id
    ONESIGNAL_API_KEY = var.onesignal_api_key
    CORS_ORIGIN       = var.cors_origin
    SENTRY_DSN        = var.sentry_dsn
  }
}
