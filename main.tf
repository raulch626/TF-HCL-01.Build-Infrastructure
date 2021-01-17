terraform {       // Required so TF knows which provider to download from TF Registry
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {  //Configures the named provider. For example, AWS.
  profile = "default" // Configuration arguments for this specific provider
  region = var.region
}

resource "aws_instance" "example" {  //Defines a piece of infrastructure. Also includes the resource type and resource name.
  ami           = var.amis[var.region]   //References the var.amis for dynamic lookup.
  instance_type = "t2.micro"
  key_name = "A4L"
  vpc_security_group_ids = [aws_security_group.allow_web.id]
  subnet_id = aws_subnet.sn-web-B.id
  user_data = file ("install_webserver.sh")

  tags = {
        Name = "A4L-BASTION"
        }
  
}
