
provider "aws" {
  region                      = var.aws_region
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true

  # endpoints {
  #   s3 = "http://localhost:4566"
  # }
}

resource "aws_s3_bucket" "mi_bucket" {
  bucket = "${var.resource_name}-${var.environment}-bucket-ayoze"

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "TSCD-P5"
    Owner       = "Estudiante-TSCD"    # <-- CAMBIO 1: Añadida nueva etiqueta
    CostCenter  = "DataScience-Lab"    # <-- CAMBIO 2: Añadida etiqueta de costes
  }
}

  # <-- CAMBIO 3: Añadido recurso para habilitar versionado
  resource "aws_s3_bucket_versioning" "bucket_versioning" {
    bucket = aws_s3_bucket.mi_bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}

# provider "aws" {
#   region = "us-east-1"
# }
#
# locals {
#   bucket_name = "mi-bucket-p6-ayozee"
#   region      = "us-east-1"
# }
#
# resource "terraform_data" "mi_bucket" {
#   input = local.bucket_name
#
#   # Se ejecuta al hacer terraform apply
#   provisioner "local-exec" {
#     command = "aws s3 mb s3://${self.input} --region ${local.region}"
#   }
#
#   # Se ejecuta al hacer terraform destroy
#   provisioner "local-exec" {
#     when    = destroy
#     command = "aws s3 rb s3://${self.input} --force"
#   }
# }

# provider "aws" {
#
#   access_key = "test"
#   secret_key = "test"
#   region = "us-east-1"
#
#   skip_credentials_validation = true
#   skip_metadata_api_check = true
#   s3_use_path_style = true
#
#   # endpoints {
#   #   ec2 = "http://localhost:4566"
#   # }
# }
#
# # --- Main VPC ---
# resource "aws_vpc" "main_vpc" {
#   cidr_block           = "10.0.0.0/16"
#   enable_dns_support   = true
#   enable_dns_hostnames = true
#
#   tags = {
#     Name = "main-vpc-terraform"
#   }
# }
#
# # --- Public Subnet ---
# resource "aws_subnet" "public_subnet" {
#   vpc_id                  = aws_vpc.main_vpc.id
#   cidr_block              = "10.0.1.0/24"
#   availability_zone       = "us-east-1a"
#   map_public_ip_on_launch = true
#
#   tags = {
#     Name = "public-subnet"
#   }
# }
#
# # --- Private Subnet ---
# resource "aws_subnet" "private_subnet" {
#   vpc_id            = aws_vpc.main_vpc.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1a"
#
#   tags = {
#     Name = "private-subnet"
#   }
# }
#
# # --- Internet Gateway (for the public subnet) ---
# resource "aws_internet_gateway" "internet_gateway" {
#   vpc_id = aws_vpc.main_vpc.id
#
#   tags = {
#     Name = "internet-gateway"
#   }
# }
#
# # --- Elastic IP for the NAT Gateway ---
# resource "aws_eip" "nat_eip" {
#   domain = "vpc"
#
#   tags = {
#     Name = "nat-eip"
#   }
# }
#
# # --- NAT Gateway (for the private subnet) ---
# resource "aws_nat_gateway" "nat_gateway" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = aws_subnet.public_subnet.id
#
#   tags = {
#     Name = "nat-gateway"
#   }
#
#   depends_on = [aws_internet_gateway.internet_gateway]
# }
#
# # --- Route Table for the Public Subnet ---
# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.main_vpc.id
#
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.internet_gateway.id
#   }
#
#   tags = {
#     Name = "public-route-table"
#   }
# }
#
# # --- Associate Public Route Table with the Public Subnet ---
# resource "aws_route_table_association" "public_association" {
#   subnet_id      = aws_subnet.public_subnet.id
#   route_table_id = aws_route_table.public_rt.id
# }
#
# # --- Route Table for the Private Subnet ---
# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.main_vpc.id
#
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gateway.id
#   }
#
#   tags = {
#     Name = "private-route-table"
#   }
# }
#
# # --- Associate Private Route Table with the Private Subnet ---
# resource "aws_route_table_association" "private_association" {
#   subnet_id      = aws_subnet.private_subnet.id
#   route_table_id = aws_route_table.private_rt.id
# }

# provider "aws" {
#   access_key = "test"
#   secret_key = "test"
#   region = "us-east-1"
#
#   skip_credentials_validation = true
#   skip_metadata_api_check = true
#   s3_use_path_style = true
#
#   endpoints {
#     s3 = "http://localhost:4566"
#   }
# }
#
# resource "aws_s3_bucket" "mi_bucket" {
#   bucket = "mi-bucket-localstack"
# }

# provider "aws" {
#   region = "us-east-1"
# }
#
# resource "aws_s3_bucket" "mi_bucket" {
#   bucket = "mi-bucket-p6-ayoze"
# }
