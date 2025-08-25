terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project            = "Policy-as-Code-Enterprise"
      ManagedBy          = "Terraform"
      Environment        = var.environment
      CostCenter         = var.cost_center
      DataClassification = "Internal"
      Owner              = var.owner_email
    }
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_organizations_policy" "security_baseline" {
  name        = "SecurityBaselinePolicy"
  description = "Enterprise security baseline controls"
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/../../policies/aws/scp/security_baseline.json")

  tags = {
    PolicyType = "Security"
    Purpose    = "Baseline security controls"
  }
}
