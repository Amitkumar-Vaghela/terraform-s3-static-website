terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "my_webapp_bucket" {
  bucket = "my-webapp-bucket-${random_id.bucket_id.hex}"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my_webapp_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "mywebapp" {
  bucket = aws_s3_bucket.my_webapp_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my_webapp_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.my_webapp_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.my_webapp_bucket.id
  source       = "./index.html"
  key          = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "style_css" {
  bucket       = aws_s3_bucket.my_webapp_bucket.id
  source       = "./style.css"
  key          = "style.css"
  content_type = "text/css"
}

output "s3_website_url" {
  value = "http://${aws_s3_bucket_website_configuration.mywebapp.website_endpoint}"   
}