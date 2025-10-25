output "alb_dns" {
  description = "Public DNS of the Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

output "ecr_repo_url" {
  description = "ECR Repository URL"
  value       = aws_ecr_repository.repo.repository_url
}

output "cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.cluster.name
}
