variable "aws_region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "demo"
}

variable "organization_name" {
  description = "Organization name for resource naming"
  type        = string
  default     = "enterprise"
}

variable "cost_center" {
  description = "Cost center code for billing allocation"
  type        = string
  default     = "IT-GOVERNANCE"
}

variable "owner_email" {
  description = "Email address of the resource owner"
  type        = string
  default     = "cloud-governance@example.com"
}

variable "compliance_frameworks" {
  description = "List of compliance frameworks to enforce"
  type        = list(string)
  default     = ["NIST-CSF", "SOC2"]
}

variable "create_organization" {
  description = "Whether to create AWS Organization and OUs"
  type        = bool
  default     = false
}

variable "enable_cloudtrail" {
  description = "Enable CloudTrail for audit logging"
  type        = bool
  default     = true
}

variable "enable_config" {
  description = "Enable AWS Config for compliance monitoring"
  type        = bool
  default     = true
}

variable "policy_enforcement_mode" {
  description = "Policy enforcement mode (audit, enforce)"
  type        = string
  default     = "audit"
}

variable "allowed_regions" {
  description = "List of allowed AWS regions"
  type        = list(string)
  default     = ["us-east-1", "us-west-2"]
}

variable "require_mfa_for_privileged_actions" {
  description = "Require MFA for privileged IAM actions"
  type        = bool
  default     = true
}

variable "enforce_encryption_at_rest" {
  description = "Enforce encryption at rest"
  type        = bool
  default     = true
}

variable "enforce_encryption_in_transit" {
  description = "Enforce encryption in transit"
  type        = bool
  default     = true
}

variable "cloudtrail_retention_days" {
  description = "CloudTrail log retention days"
  type        = number
  default     = 90
}

variable "config_snapshot_frequency" {
  description = "Config snapshot frequency"
  type        = string
  default     = "Daily"
}

variable "notification_email" {
  description = "Email for governance notifications"
  type        = string
  default     = "governance-alerts@example.com"
}

variable "demo_mode" {
  description = "Enable demo mode"
  type        = bool
  default     = true
}

variable "create_sample_violations" {
  description = "Create sample violations for testing"
  type        = bool
  default     = false
}

variable "data_classification" {
  description = "Data classification level"
  type        = string
  default     = "Internal"
}

variable "restricted_instance_types" {
  description = "EC2 instance types that require approval"
  type        = list(string)
  default     = ["p3.24xlarge", "p4d.24xlarge"]
}

variable "enable_cross_region_replication" {
  description = "Enable cross-region replication for audit logs"
  type        = bool
  default     = false
}

variable "enable_log_encryption" {
  description = "Enable encryption for CloudWatch logs"
  type        = bool
  default     = true
}

variable "enable_guardduty" {
  description = "Enable GuardDuty for threat detection"
  type        = bool
  default     = false
}

variable "enable_security_hub" {
  description = "Enable Security Hub for centralized security findings"
  type        = bool
  default     = false
}
