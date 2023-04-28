# AWS Key Pair

Add our public key to AWS so we can ssh to EC2 instance.

It's seperate with EC2 module since we may want to use the same key for several instance.
We may also want to make several EC2 instance with `count`, so the key\_pair should not also created several times.

---

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_name"></a> [key\_name](#output\_key\_name) | The name of the AWS key pair. We can pass this name to `key_name` in `aws_instance` |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name of the AWS key pair to create. This value must be unique within your account. | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | The path to the public SSH key file to use for the AWS key pair. e.g. `~/.ssh/id_rsa.pub` (remember, we only need the public key, not the private key). | `string` | n/a | yes |

---

Created by [@tegarimansyah](https://github.com/tegarimansyah) for [cloud workshop](https://github.com/tegarimansyah/cloud-workshop)
