output "s3_bucket_id" {
    description = "The ID of S3 Bucket"
    value = aws_s3_bucket.website_bucket.id
}

output "s3_bucket_arn" {
    description = "The ARN of S3 Bucket"
    value = aws_s3_bucket.website_bucket.arn 
}

output "website_url" {
    description = "website url"
    value = "http://${aws_s3_bucket.website_bucket.bucket}.s3-website-${var.region}.amazonaws.com"
}

output "index_document"{
    description = "The index of S3 bucket"
    value = var.index_document
}

output "bucket_regional_domain_name" {
    description = "The regional domain name of the s3 bucket"
    value = aws_s3_bucket.website_bucket.bucket_domain_name
}