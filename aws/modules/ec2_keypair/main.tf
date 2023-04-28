/**
 * # AWS Key Pair
 *
 * Add our public key to AWS so we can ssh to EC2 instance. 
 * 
 * It's seperate with EC2 module since we may want to use the same key for several instance. 
 * We may also want to make several EC2 instance with `count`, so the key_pair should not also created several times. 
 *
 */

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file(var.public_key)
}