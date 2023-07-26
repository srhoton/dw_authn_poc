variable "base_cidr_block" {
  description = "The CIDR block for the VPC."
  default     = "10.1.0.0/16"
}

variable "env_name" {
  description = "The name of the environment."
  default     = "authn-poc"
}
