
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

locals {
  env = {
    default = {
    }
    uat = {
    }
    production = {
    }
  }
  environmentvars = "${contains(keys(local.env), terraform.workspace) ? terraform.workspace: "default"}"
  workspace = "${merge(local.env["default"], local.env[local.environmentvars])}"
}
