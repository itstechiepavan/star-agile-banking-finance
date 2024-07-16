terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "ap-southeast-2"  # Ensure this matches your desired region
}

# Create an EC2 instance
resource "aws_instance" "New-Server" {
  ami               = "ami-03f0544597f43a91d"  # Ubuntu AMI ID for ap-southeast-2
  instance_type     = "t2.medium"
  availability_zone = "ap-southeast-2a"
  key_name          = "project"  # Replace with your actual key pair name

  vpc_security_group_ids = ["sg-0fd0aa0c6b28357f4"]  # Security Group ID

  tags = {
    Name = "New-Server"
  }
}
