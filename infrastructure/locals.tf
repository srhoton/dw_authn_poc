locals {
  authn_poc_validations = length(aws_acm_certificate.authn-poc-cert) > 0 ? {
    for dvo in aws_acm_certificate.authn-poc-cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  } : {}

}
