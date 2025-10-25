variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID donde se desplegará el ECS"
  type        = string
}

variable "subnets" {
  description = "Lista de subnets públicas donde correrán las tareas Fargate"
  type        = list(string)
}

variable "app_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "nitro2-payments"
}
