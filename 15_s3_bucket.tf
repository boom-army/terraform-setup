data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "app" {
  bucket = var.domain
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = ["Content-Range", "Content-Length", "ETag"]
  }
}

resource "aws_s3_bucket_policy" "app_public_read" {
  bucket = aws_s3_bucket.app.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.app.arn,
          "${aws_s3_bucket.app.arn}/*",
        ]
      },
    ]
  })
}

resource "aws_s3_bucket" "sosol_prod" {
  bucket = var.aws_bucket

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD", "PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "sosol_prod_policy" {
  bucket = aws_s3_bucket.sosol_prod.id

  policy = jsonencode({
    "Version" = "2012-10-17"
    "Statement" = [
      {
        "Effect"    = "Allow"
        "Principal" = "*"
        "Action" = [
          "s3:ListBucket"
        ]
        "Resource" = [
          aws_s3_bucket.sosol_prod.arn
        ]
      },
      {
        "Effect"    = "Allow"
        "Principal" = "*"
        "Action" = [
          "s3:GetObject"
        ]
        "Resource" = [
          "${aws_s3_bucket.sosol_prod.arn}/*"
        ]
      },
      {
        "Effect" = "Allow"
        "Principal" = {
          "AWS" = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        "Action" = [
          "s3:PutObject"
        ]
        "Resource" = [
          "${aws_s3_bucket.sosol_prod.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_s3_bucket" "sosol_dev" {
  bucket = var.aws_bucket_dev

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD", "PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "sosol_dev_policy" {
  bucket = aws_s3_bucket.sosol_dev.id

  policy = jsonencode({
    "Version" = "2012-10-17"
    "Statement" = [
      {
        "Effect"    = "Allow"
        "Principal" = "*"
        "Action" = [
          "s3:ListBucket"
        ]
        "Resource" = [
          aws_s3_bucket.sosol_dev.arn
        ]
      },
      {
        "Effect"    = "Allow"
        "Principal" = "*"
        "Action" = [
          "s3:GetObject"
        ]
        "Resource" = [
          "${aws_s3_bucket.sosol_dev.arn}/*"
        ]
      },
      {
        "Effect" = "Allow"
        "Principal" = {
          "AWS" = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        "Action" = [
          "s3:PutObject"
        ]
        "Resource" = [
          "${aws_s3_bucket.sosol_dev.arn}/*"
        ]
      }
    ]
  })
}