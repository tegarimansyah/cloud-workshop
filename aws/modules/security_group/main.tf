resource "aws_security_group" "this" {
  name = var.name
  description = var.description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = local.ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      security_groups  = ingress.value.security_groups
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = local.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      security_groups  = egress.value.security_groups
      description = egress.value.description
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "id" {
  value = aws_security_group.this.id
}