output "bucket_name" {
    value = element(concat(aws_s3_bucket.main.*.id, [""]), 0)
    description = "Name of the bucket"
}

output "bucket_arn" {
    value = element(concat(aws_s3_bucket.main.*.arn, [""]), 0)
    description = "ARN of the bucket"
}