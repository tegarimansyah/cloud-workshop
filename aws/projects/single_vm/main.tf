/**
 * # AWS EC2 with security group and public key
 *
 * This project is an example of basic terraform modules usage. We will use pre-defined modules and create a new infrastructure based on that.
 * Think this approach is building from blocks like a lego.
 * 
 * ## What happen when we run `terraform apply` 
 *
 * First of all, terraform will read input from `variable` block. After that, it will do some processing with `locals` and `data` blocks.
 * If everything good, then it will try to make a plan to implement resource and module. We need to do `terraform init` again if we add a new module.
 * Resource in module is isolated, so even though we create multiple resource with same module, it will not conflicted.
 * 
 * In this project, we create a security group with open port 80, 443 and 22 from internet. It need VPC id, and we just simply use default VPC from `data` instead of creating a new one.
 * 
 * After terraform create security group and key pair, it will try to create an EC2 module. It will use output from each module and get a init script using file (use it as is instead of interpolate the variable).
 * 
 * If everything good, we can see output from ec2_data. We can also get raw data with combination with jq, useful for scripting.
 *
 * ```bash
 * terraform output -json ec2_data | jq -r ".public_dns"
 * ```
 */
 
 module "ec2_security_group" {
  source = "../../modules/security_group"

  name        = "EC2 Security Group - ${terraform.workspace}"
  description = "A security group for EC2"
  vpc_id      = data.aws_vpc.default.id

  ingress_rules = [
    { port = 22 },
    { port = 80 },
    { port = 443 },
  ]
  egress_rules = [
    { port = 0 }
  ]
}

module "key_pair" {
  source = "../../modules/ec2_keypair"

  key_name = "default"
  public_key = "~/.ssh/id_rsa.pub"
}

module "ec2_instance" {
  source = "../../modules/ec2"

  name = "single-vm-demo"

  instance_type = "t3.micro"
  public_key_name = module.key_pair.key_name
  ami = data.aws_ami.amazon_linux_2.id
  init_script = file("./script/start-nginx.sh")
  security_group_id = [module.ec2_security_group.id]
}

output "ec2_data" {
  value = module.ec2_instance
}