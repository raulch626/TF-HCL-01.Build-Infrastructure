output "ami" {
  value = aws_instance.example.ami
}


output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

