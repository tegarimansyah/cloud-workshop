###################
# INPUT
###################

variable "name" {
  description = "The instance name."
  default     = ""
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance."
  default     = "t3.small"
}

variable "public_key_name" {
  description = "The public key name that already registered in AWS"
}

variable "ami" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the EC2 instance."
  type = string
}

variable "init_script" {
  description = "A script to run on the EC2 instance at launch time."
  default     = ""
}

variable "security_group_id" {
  description = "A list of security group IDs to associate with the EC2 instance."
  type        = list(string)
}

###################
# OUTPUT
###################

output "id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.web.id
}

output "public_dns" {
  description = "The public DNS name of the EC2 instance."
  value       = aws_instance.web.public_dns
}

output "public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.web.public_ip
}
