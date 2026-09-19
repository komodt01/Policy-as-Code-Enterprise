output "security_baseline_policy_id" {
description = "AWS Organizations Security Baseline SCP policy ID"
value       = aws_organizations_policy.security_baseline.id
}

output "cost_controls_policy_id" {
description = "AWS Organizations Cost Controls SCP policy ID"
value       = aws_organizations_policy.cost_controls.id
}

output "data_protection_policy_id" {
description = "AWS Organizations Data Protection SCP policy ID"
value       = aws_organizations_policy.data_protection.id
}

output "managed_scp_policy_ids" {
description = "Map of AWS Organizations SCP policy IDs managed by this Terraform configuration"

value = {
security_baseline = aws_organizations_policy.security_baseline.id
cost_controls     = aws_organizations_policy.cost_controls.id
data_protection   = aws_organizations_policy.data_protection.id
}
}
