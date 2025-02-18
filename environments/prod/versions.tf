terraform {
  required_version = ">= 0.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
    awscc = {
      source = "hashicorp/awscc"
      version = "0.74.0"
    }
  }
}