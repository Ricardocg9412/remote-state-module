provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "main" {
  bucket        = format("%s-%s-%s", var.namespace, var.stage, var.name)
  acl           = var.acl
  region        = var.region
  force_destroy = var.force_destroy

  versioning {
    enabled    = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Terraform   = "true"
    Environment = var.stage
  }

}