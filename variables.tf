
variable "aws_region" {
  description = "Región de AWS donde se desplegarán los recursos"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "resource_name" {
  description = "Nombre base identificador para el recurso"
  type        = string
  default     = "tscd-storage"
}

