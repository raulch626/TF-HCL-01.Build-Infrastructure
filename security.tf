# Create a Security Group to allow ports 22,80 and 443.
resource "aws_security_group" "allow_web" {
    name        = "allow_web_traffic"
    description = "Allow web inbound traffic"
    vpc_id      = aws_vpc.main.id
  
    ingress {
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
    ingress {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
    ingress {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"  // Allows any protocol for egress
      cidr_blocks = ["0.0.0.0/0"]
    }
  
    tags = {
      Name = "allow_web"
    }
  }