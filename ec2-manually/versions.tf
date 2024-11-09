terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.0"
    }
  }

  backend "s3" {
    bucket = "value"
    key = "terraform.tfstate"
    region = "var.aws_region"
  }
}

provider "aws" {
  region = "us-east-1"
}