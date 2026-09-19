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

# ---------------------------------------------------------------------------

# AWS Organizations Service Control Policies

#

# These resources manage the SCP definitions as code. Policy attachment to

# organizational units or accounts is intentionally handled separately so

# that policy creation does not automatically introduce organization-wide

# enforcement.

# ---------------------------------------------------------------------------

resource "aws_organizations_policy" "security_baseline" {
name        = "SecurityBaselinePolicy"
description = "Baseline governance controls for AWS resources"
type        = "SERVICE_CONTROL_POLICY"
content     = file("${path.module}/../../policies/aws/scp/security_baseline.json")

tags = {
PolicyType = "Security"
Purpose    = "Baseline governance controls"
}
}

resource "aws_organizations_policy" "cost_controls" {
name        = "CostControlsPolicy"
description = "Governance controls for resource cost and allocation requirements"
type        = "SERVICE_CONTROL_POLICY"
content     = file("${path.module}/../../policies/aws/scp/cost_controls.json")

tags = {
PolicyType = "Governance"
Purpose    = "Cost and resource governance"
}
}

resource "aws_organizations_policy" "data_protection" {
name        = "DataProtectionPolicy"
description = "Governance controls supporting data protection requirements"
type        = "SERVICE_CONTROL_POLICY"
content     = file("${path.module}/../../policies/aws/scp/data_protection.json")

tags = {
PolicyType = "Security"
Purpose    = "Data protection governance"
}
}
