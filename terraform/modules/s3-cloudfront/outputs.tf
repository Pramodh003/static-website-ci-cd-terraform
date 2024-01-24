output "cloudfront_distribution_id" {
    description = "The id of cloudfront distribution"
    value = aws_cloudfront_distribution.website_distribution.id
}

