terraform {
  # Uncomment this when you ready using remote state
  #   backend "s3" {
  #     # Replace this with your bucket name!
  #     bucket         = "your-tf-state"
  #     key            = "tfstate/terraform.tfstate"
  #     region         = "us-east-1"
  #     encrypt        = true
  #     dynamodb_table = "your-tf-state"
  #   }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.55"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = local.tags
  }
}
