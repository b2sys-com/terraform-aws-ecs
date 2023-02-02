variable "fargate_cluster_name" {
  description = "ECS Fargate Cluster name"
  type        = string
}

variable "vpc_id" {
  description = "Vpc id for this fargate cluster"
  type        = string
}

variable "lb_sg_names" {
  description = "Security groups names to apply to sg rules"
  type        = list(string)
  default     = []
}

variable "sg_inbound" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "This variable is used to define new security group ingress traffic access"
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "tags" {
  description = "Map of tags to be use in resource creation"
  type        = map(string)
}
