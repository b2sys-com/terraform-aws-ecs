output "fargate_sg_ids" {
  description = "List of Security groups attached to fargate"
  value       = [aws_security_group.fargate_sg.id]
}

output "fargate_id" {
  description = "ECS cluster id"
  value       = aws_ecs_cluster.main.id
}

output "fargate_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main.name
}

output "fargate_cluster_arn" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main.arn
}