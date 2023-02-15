resource "aws_ecs_cluster" "main" {
  name = var.fargate_cluster_name
  tags = var.tags

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

/*resource "aws_security_group" "fargate_sg" {
  name        = "${var.fargate_cluster_name}-sg"
  description = "Cloud ECS Security Group for: ${var.fargate_cluster_name}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = [for s in var.sg_inbound : {
      from_port   = s.from_port != null ? s.from_port : null
      to_port     = s.to_port != null ? s.to_port : null
      protocol    = s.protocol != null ? s.protocol : null
      cidr_blocks = s.cidr_blocks != null ? s.cidr_blocks : null
    }]

    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = var.lb_sg_names
      cidr_blocks     = ingress.value.cidr_blocks
    }
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [name]
  }

  tags       = var.tags
  depends_on = [aws_ecs_cluster.main]

}*/

/*resource "aws_security_group_rule" "allow_all_output" {
  description       = "Cloud ECS Security Group for Outgoing Traffic for: ${var.fargate_cluster_name}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.fargate_sg.id
  depends_on        = [aws_ecs_cluster.main, aws_security_group.fargate_sg]
}*/
