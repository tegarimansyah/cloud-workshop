#########
# Input
#########
variable "key_name" {
  description = "The name of the AWS key pair to create. This value must be unique within your account."
  type = "string"
}

variable "public_key" {
  description = "The path to the public SSH key file to use for the AWS key pair. e.g. `~/.ssh/id_rsa.pub` (remember, we only need the public key, not the private key)."
  type = "string"
}

#########
# Output
#########
output "key_name" {
    description = "The name of the AWS key pair. We can pass this name to `key_name` in `aws_instance`"
    value = aws_key_pair.this.key_name
}