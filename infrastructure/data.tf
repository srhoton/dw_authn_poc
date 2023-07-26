data "aws_region" "current" {}

data "aws_route53_zone" "this" {
  name         = "steverhoton.com"
  private_zone = false
}
