terraform {
  required_version = ">= 1.4.6"
  required_providers {
    aws = ">= 4.0"
  }
}

provider "aws" {
    profile = "default"
    shared_credentials_files = "~/.aws/credentials"
    region = us-east-1
}