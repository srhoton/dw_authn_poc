resource "aws_acm_certificate" "authn-poc-cert" {
  domain_name       = "authn-poc.steverhoton.com"
  validation_method = "DNS"
}
