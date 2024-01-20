output "ssl_cert_arn"{
    description= "The ARN of ssl certficate"
    value = aws_acm_certificate.ssl_certifcate
}

output "route53_zone_id" {
    description = "The ID of orute53"
    value = data.aws_route53_zone.dns_zone.id
}