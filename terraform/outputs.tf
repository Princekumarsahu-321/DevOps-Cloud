output "instance_id" {
  description = "ID of the created EC2 instance."
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address assigned by AWS, if available."
  value       = aws_instance.app_server.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name assigned by AWS, if available."
  value       = aws_instance.app_server.public_dns
}