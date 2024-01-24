output "ssl_cert_arn"{
    description= "The ARN of ssl certficate"
    value = aws_acm_certificate.ssl_certifcate.arn
}

output "route53_zone_id" {
    description = "The ID of orute53"
    value = data.aws_route53_zone.dns_zone.id
}

output "root_domain"{
    description = "Root domain name for website"
    value = var.root_domain
}