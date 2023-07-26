resource "aws_ecr_repository" "authn-poc_repository" {
  name = "authn-poc_repository"
  tags = {
    Name = "authn-poc_repository"
  }
}
