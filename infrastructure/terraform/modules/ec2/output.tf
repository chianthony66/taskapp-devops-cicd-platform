output "frontend_public_ip" {
  description = "Public IP address of the frontend EC2 instance"
  value       = aws_instance.frontend.public_ip
}

output "frontend_instance_id" {
  description = "Instance ID of frontend server"
  value       = aws_instance.frontend.id
}

output "backend_public_ip" {
  description = "Public IP address of the backend EC2 instance"
  value       = aws_instance.backend.public_ip
}

output "backend_private_ip" {
  description = "Private IP address of the backend EC2 instance"
  value       = aws_instance.backend.private_ip
}

output "backend_instance_id" {
  description = "Instance ID of backend server"
  value       = aws_instance.backend.id
}