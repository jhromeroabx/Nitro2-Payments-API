# 🚀 Nitro2 Payments API - Infraestructura AWS con Terraform

Este módulo crea la infraestructura completa para desplegar Nitro2 Payments en AWS:
- IAM Role y Policies
- ECR Repository
- ECS Cluster y Service (Fargate)
- ALB + Target Group + Listener
- Security Group

## 🧰 Requisitos
- AWS CLI configurado (`aws configure`)
- Terraform >= 1.5.0
- Docker (para la imagen)
- Repositorio ECR vacío o existente

## ⚙️ Comandos

```bash
terraform init
terraform plan -out tfplan
terraform apply tfplan
