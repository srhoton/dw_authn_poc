resource "aws_lb" "authn-poc_lb" {
  name = "authn-poc-lb"
  internal = false
  load_balancer_type = "application"
  subnets = module.default_network.public_subnet_list

  tags = {
    Name = "authn-poc_lb"
    }
}

resource "aws_lb_target_group" "authn-poc_target_group_rails" {
  name = "authn-poc-target-group-rails"
  port = 3000
  protocol = "HTTP"
  vpc_id = module.default_network.vpc_id
}

resource "aws_lb_target_group_attachment" "rails_bastion" {
  target_group_arn = aws_lb_target_group.authn-poc_target_group_rails.arn
  target_id        = aws_instance.bastion_instance.id
  port             = 3000
}
resource "aws_lb_listener" "authn-poc_listener_rails" {
  load_balancer_arn = aws_lb.authn-poc_lb.arn
  port = "443"
  protocol = "HTTPS"
  certificate_arn = aws_acm_certificate.authn-poc-cert.arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.authn-poc_target_group_rails.arn
  }
}
