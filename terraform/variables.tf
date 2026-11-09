variable "aws_region" {
  description = "AWS region in which to create the instance."
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "Region-specific AMI ID for the instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Optional existing EC2 key pair name."
  type        = string
  default     = null
}

variable "name" {
  description = "Name tag for the EC2 instance."
  type        = string
  default     = "mern-app-server"
}

variable "environment" {
  description = "Environment tag for the EC2 instance."
  type        = string
  default     = "development"
}