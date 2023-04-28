###################
# Get Default VPC
###################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "id_list" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

###################
# Get Ubuntu AMI
###################
data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20230119.1-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}