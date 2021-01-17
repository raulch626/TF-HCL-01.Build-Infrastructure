
  
  #Create VPC
  resource "aws_vpc" "main" {
    cidr_block       = "10.16.0.0/16"
    instance_tenancy = "default"
  
    tags = {
      Name = "a4l-vpc1"
    }
  }
  
  # Create subnets
  
    resource "aws_subnet" "sn-DB-A" {
  
      vpc_id     = aws_vpc.main.id
      cidr_block 	= "10.16.16.0/20"  
      availability_zone = "us-east-1a"
      
      tags = {
        Name = "sn-db-A"
      }
  }

    resource "aws_subnet" "sn-app-A" {
    
      vpc_id     = aws_vpc.main.id
      cidr_block 	= "10.16.32.0/20"  
      availability_zone = "us-east-1a"
      
      tags = {
        Name = "sn-app-A"
        }
    }
    
    resource "aws_subnet" "sn-web-A" {
    
      vpc_id     = aws_vpc.main.id
      cidr_block 	= "10.16.48.0/20"  
      map_public_ip_on_launch = true
      availability_zone = "us-east-1a"
      
      tags = {
        Name = "sn-web-A"
        }
    }
    
    resource "aws_subnet" "sn-db-B" {
    
      vpc_id     = aws_vpc.main.id
      cidr_block 	= "10.16.80.0/20"  
      availability_zone = "us-east-1b"
      
      tags = {
        Name = "sn-db-B"
        }
    }
    
    resource "aws_subnet" "sn-app-B" {
    
      vpc_id     = aws_vpc.main.id
      cidr_block 	= "10.16.96.0/20"  
      availability_zone = "us-east-1b"
      
      tags = {
        Name = "sn-app-B"
        }
    }
    
    resource "aws_subnet" "sn-web-B" {
    
      vpc_id     = aws_vpc.main.id
      cidr_block 	= "10.16.112.0/20"  
      map_public_ip_on_launch = true
      availability_zone = "us-east-1b"

      
      tags = {
        Name = "sn-web-B"
        }
    }
    
    resource "aws_subnet" "sn-db-C" {
    
      vpc_id     = aws_vpc.main.id
      cidr_block 	= "10.16.144.0/20"  
      availability_zone = "us-east-1c"
      
      tags = {
        Name = "sn-db-C"
        }
    }
    
    resource "aws_subnet" "sn-app-C" {
    
      vpc_id     = aws_vpc.main.id
      cidr_block 	= "10.16.160.0/20"  
      availability_zone = "us-east-1c"
      
      tags = {
        Name = "sn-app-C"
        }
    }
    
    resource "aws_subnet" "sn-web-C" {
    
      vpc_id     = aws_vpc.main.id
      cidr_block 	= "10.16.176.0/20"  
      map_public_ip_on_launch = true
      availability_zone = "us-east-1c"
      
      tags = {
        Name = "sn-web-C"
        }
    }

    # Create an internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "a4l-vpc1-igw"
        }
  }
  
  # Create a custom route table
  resource "aws_route_table" "rt_table" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "a4l-vpc1-rt-web"
        }
  
    # IPv4 default route
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    }
  }
   

  # Associate subnets with Route Table
resource "aws_route_table_association" "rtA" {
    subnet_id      = aws_subnet.sn-web-A.id
    route_table_id = aws_route_table.rt_table.id
  }

resource "aws_route_table_association" "rtB" {
    subnet_id      = aws_subnet.sn-web-B.id
    route_table_id = aws_route_table.rt_table.id
  }

resource "aws_route_table_association" "rtC" {
    subnet_id      = aws_subnet.sn-web-C.id
    route_table_id = aws_route_table.rt_table.id
  }  