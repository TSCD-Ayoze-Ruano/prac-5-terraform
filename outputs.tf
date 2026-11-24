
output "s3_bucket_name" {
  description = "Nombre único del bucket S3 para ingesta de datos en otras prácticas"
  value       = aws_s3_bucket.mi_bucket.id
}

output "s3_bucket_arn" {
  description = "ARN del bucket S3 para configurar políticas de acceso IAM en futuros servicios"
  value       = aws_s3_bucket.mi_bucket.arn
}

output "s3_endpoint_url" {
  description = "Punto de conexión utilizado (útil para configurar clientes boto3/SDK hacia LocalStack)"
  value       = "http://localhost:4566"
}

