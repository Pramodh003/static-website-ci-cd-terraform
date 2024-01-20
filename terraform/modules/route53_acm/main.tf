data "aws_route53_zone" "dns_zone" {
  name         = var.root_domain
  private_zone = false
}

resource "aws_acm_certificate" "ssl_certifcate" {
  domain_name       = var.root_domain
  subject_alternative_names = ["*.${var.root_domain}"]
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = false
  }
}
resource "aws_route53_record" "ssl_certifcate" {
  zone_id = data.aws_route53_zone.dns_zone.zone_id
  name    = tolist(aws_acm_certificate.ssl_certifcate.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.ssl_certifcate.domain_validation_options)[0].resource_record_type
  ttl     = var.dns_record_ttl
  records = [tolist(aws_acm_certificate.ssl_certifcate.domain_validation_options)[0].resource_record_value]
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "ssl_validation" {
  certificate_arn         = aws_acm_certificate.ssl_certifcate.arn
  validation_record_fqdns = [aws_route53_record.ssl_certifcate.fqdn]
}

