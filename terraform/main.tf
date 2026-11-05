
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create EC2 Instance
resource "aws_instance" "my_server" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  tags = {
    Name        = "My-Terraform-Server"
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}
