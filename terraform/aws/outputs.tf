output "security_baseline_policy_id" {
  description = "Security Baseline SCP Policy ID"
  value       = aws_organizations_policy.security_baseline.id
}
