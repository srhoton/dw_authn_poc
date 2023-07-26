terraform {
  backend "s3" {
    bucket = "b2c-tfstate"
    key    = "b2c/authn-poc.tfstate"
    region = "us-west-2"
  }
}
