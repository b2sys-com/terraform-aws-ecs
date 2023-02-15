resource "aws_ecs_cluster" "main" {
  name = var.fargate_cluster_name
  tags = var.tags

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
