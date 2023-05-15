terraform {
  required_version = ">= 1.4.6"
  required_providers {
    aws = ">= 4.0"
  }

  backend "s3" {
    bucket = "lcaldeirini-tf-aws-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
}
}


provider "aws" {
  region = "us-east-1"
  profile = "default"
  shared_credentials_files = ["~/.aws/credentials"]
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.inst_type
  disable_api_termination = var.disable_api_termination

  tags = {
    Name = "terraform_aws"
  }
}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  disable_api_termination = var.disable_api_termination

  tags = {
    Name = "test_tf"
  }
}
