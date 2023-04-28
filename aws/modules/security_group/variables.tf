variable "name" {
  description = "The name of the security group"
}

variable "description" {
  description = "A description of the security group"
}

variable "vpc_id" {
  description = "The ID of the VPC to associate with the security group"
}

variable "ingress_rules" {
  description = "A list of ingress rules for the security group"
  type = list(object({
    description = optional(string)
    port        = optional(number)
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = optional(string, "tcp")
    cidr_blocks = optional(list(string), ["0.0.0.0/0"])
    security_groups = optional(list(string), [])
  }))
  default = []
}

variable "egress_rules" {
  description = "A list of egress rules for the security group"
  type = list(object({
    description = optional(string)
    port        = optional(number)
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = optional(string, "-1")
    cidr_blocks = optional(list(string), ["0.0.0.0/0"])
    security_groups = optional(list(string), [])
  }))
  default = []
}

locals {
  ingress = [
    for rule in var.ingress_rules :
    {
      from_port   = rule.from_port != null ? rule.from_port : rule.port
      to_port     = rule.to_port != null ? rule.to_port : rule.port
      protocol    = rule.protocol
      cidr_blocks = rule.cidr_blocks
      security_groups  = rule.security_groups
      description = rule.description
    }
  ]

  egress = [
    for rule in var.egress_rules : {
      from_port   = rule.from_port != null ? rule.from_port : rule.port
      to_port     = rule.to_port != null ? rule.to_port : rule.port
      protocol    = rule.protocol
      cidr_blocks = rule.cidr_blocks
      security_groups  = rule.security_groups
      description = rule.description
    }
  ]
}