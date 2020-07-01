terraform {
    backend "s3" {}
}

data "aws_caller_identity" "default" {}

provider "aws" {
    profile = "default"
    region  = var.region
}