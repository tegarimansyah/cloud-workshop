# AWS EC2 with security group and public key

This project is an example of basic terraform modules usage. We will use pre-defined modules and create a new infrastructure based on that.
Think this approach is building from blocks like a lego.

## What happen when we run `terraform apply`

First of all, terraform will read input from `variable` block. After that, it will do some processing with `locals` and `data` blocks.
If everything good, then it will try to make a plan to implement resource and module. We need to do `terraform init` again if we add a new module.
Resource in module is isolated, so even though we create multiple resource with same module, it will not conflicted.

In this project, we create a security group with open port 80, 443 and 22 from internet. It need VPC id, and we just simply use default VPC from `data` instead of creating a new one.

After terraform create security group and key pair, it will try to create an EC2 module. It will use output from each module and get a init script using file (use it as is instead of interpolate the variable).

If everything good, we can see output from ec2\_data. We can also get raw data with combination with jq, useful for scripting.

```bash
terraform output -json ec2_data | jq -r ".public_dns"
```

---

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_instance"></a> [ec2\_instance](#module\_ec2\_instance) | ../../modules/ec2 | n/a |
| <a name="module_ec2_security_group"></a> [ec2\_security\_group](#module\_ec2\_security\_group) | ../../modules/security_group | n/a |
| <a name="module_key_pair"></a> [key\_pair](#module\_key\_pair) | ../../modules/ec2_keypair | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnets.id_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_data"></a> [ec2\_data](#output\_ec2\_data) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |

---

Created by [@tegarimansyah](https://github.com/tegarimansyah) for [cloud workshop](https://github.com/tegarimansyah/cloud-workshop)
