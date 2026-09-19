variable "aws_region" {
description = "AWS region used by the provider"
type        = string
default     = "us-east-1"
}

variable "environment" {
description = "Environment associated with the Policy-as-Code project"
type        = string
default     = "demo"
}

variable "cost_center" {
description = "Cost center applied to supported AWS resources through provider default tags"
type        = string
default     = "IT-GOVERNANCE"
}

variable "owner_email" {
description = "Owner identifier applied to supported AWS resources through provider default tags"
type        = string
default     = "[cloud-governance@example.com](mailto:cloud-governance@example.com)"
}
