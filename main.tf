provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "main" {
  bucket = var.name

  versioning {
    enabled = true
  }
  
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}