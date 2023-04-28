/**
 * # AWS EC2 Instance
 *
 * This module is wrapper of [aws_instance resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance).
 *
 * Why we create a module instead of using it directly? Sometimes we need "standard" configuration for several projects. It will tedious to manage these standard if distributed to multiple project.
 * 
 * Additionally, we can also use more popular modules like this one: [aws_instance resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance).
 * But for learning purpose, we will stick to our module and grow with it.
 */

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type

  user_data       = var.init_script
  key_name        = var.public_key_name
  vpc_security_group_ids = var.security_group_id

  tags = {
    Name = var.name
  }
}