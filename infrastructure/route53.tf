resource "aws_route53_record" "authn_poc_validations" {
  for_each = local.authn_poc_validations

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.this.zone_id
}

resource "aws_route53_record" "authn_poc" {
  zone_id = "Z0738030YKODO2ZBZ8JM"
  name    = "authn-poc.steverhoton.com"
  type    = "A"

  alias {
    name                   = aws_lb.authn-poc_lb.dns_name
    zone_id                = aws_lb.authn-poc_lb.zone_id
    evaluate_target_health = false
  }
}
