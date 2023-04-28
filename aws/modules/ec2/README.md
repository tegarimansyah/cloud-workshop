# AWS EC2 Instance

This module is wrapper of [aws\_instance resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance).

Why we create a module instead of using it directly? Sometimes we need "standard" configuration for several projects. It will tedious to manage these standard if distributed to multiple project.

Additionally, we can also use more popular modules like this one: [aws\_instance resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance).
But for learning purpose, we will stick to our module and grow with it.

---

## Resources

| Name | Type |
|------|------|
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the EC2 instance. |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | The public DNS name of the EC2 instance. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP address of the EC2 instance. |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | The ID of the Amazon Machine Image (AMI) to use for the EC2 instance. | `string` | n/a | yes |
| <a name="input_init_script"></a> [init\_script](#input\_init\_script) | A script to run on the EC2 instance at launch time. | `string` | `""` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type to use for the EC2 instance. | `string` | `"t3.small"` | no |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | The path to the public key file to use for SSH authentication. | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | A list of security group IDs to associate with the EC2 instance. | `list(string)` | n/a | yes |

---

Created by [@tegarimansyah](https://github.com/tegarimansyah) for [cloud workshop](https://github.com/tegarimansyah/cloud-workshop)
