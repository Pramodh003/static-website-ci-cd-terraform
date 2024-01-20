output "iam_user_name" {
  description = "User arn"
  value = module.backend.iam_user_arn

}

output "s3_bucket_id" {
    description = "The ID of S3 Bucket"
    value = module.s3_website.s3_bucket_id
}

output "s3_bucket_arn" {
    description = "The ARN of S3 Bucket"
    value =  module.s3_website.s3_bucket_arn
}

output "website_url" {
    description = "website url"
    value = module.s3_website.website_url
}