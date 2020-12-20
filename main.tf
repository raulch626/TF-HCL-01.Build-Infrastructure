terraform {       // Required so TF knows which provider to download from TF Registry
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {  //Configures the named provider. For example, AWS.
  profile = "default"
  region = var.region
}

resource "aws_instance" "example" {  //Defines a piece of infrastructure. Also includes the resource type and resource name.
  ami           = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
}
