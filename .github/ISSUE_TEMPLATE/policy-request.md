---
name: Policy Request
about: Request a new governance policy or modification to existing policy
title: '[POLICY] '
labels: ['policy-request', 'governance', 'needs-review']
assignees: ''
---

## 🎯 Policy Request Summary

**Policy Type:** <!-- AWS SCP / Azure Policy / GCP Org Policy / Multi-Cloud -->
**Priority:** <!-- High / Medium / Low -->
**Compliance Framework:** <!-- NIST-CSF / SOC2 / HIPAA / PCI-DSS / SOX / Other -->
**Business Justification:** <!-- Required for all policy requests -->

## 💼 Business Context

### Regulatory Requirement
- [ ] SOX (Sarbanes-Oxley)
- [ ] HIPAA
- [ ] PCI-DSS
- [ ] GDPR
- [ ] SOC 2
- [ ] ISO 27001
- [ ] CIS Controls
- [ ] Custom/Industry-specific: ___________

### Business Driver
- [ ] Security incident prevention
- [ ] Cost optimization
- [ ] Compliance audit requirement
- [ ] Risk mitigation
- [ ] Operational efficiency
- [ ] Executive mandate
- [ ] Customer requirement
- [ ] Other: ___________

**Expected Business Value:**
<!-- Describe quantifiable benefits: cost savings, risk reduction, efficiency gains -->
<!-- Example: Cost savings: $50,000* annually, Security incidents reduced by: 25%* -->

**Impact if NOT Implemented:**
<!-- Describe risks, compliance gaps, or business consequences -->
<!-- Example: Potential compliance penalty: $100,000*, Audit findings increased by: 40%* -->

## 🔧 Technical Requirements

### Deployment Scope
- [ ] Single cloud provider
- [ ] Multi-cloud
- [ ] Specific business unit: ___________
- [ ] Organization-wide
- [ ] Pilot program first

### Resources Affected
- [ ] Compute (EC2, VMs, Compute Engine)
- [ ] Storage (S3, Blob Storage, Cloud Storage)
- [ ] Networking (VPC, VNet, VPC)
- [ ] Identity & Access Management
- [ ] Databases
- [ ] Serverless functions
- [ ] Container services
- [ ] Other: ___________

### Policy Enforcement Level
- [ ] **Deny** - Block non-compliant actions (recommended for security)
- [ ] **Audit** - Log violations for review (recommended for initial deployment)
- [ ] **Warn** - Alert but allow action (recommended for advisory policies)
- [ ] **Remediate** - Automatically fix violations (advanced)

## 📖 Policy Specification

**Proposed Policy Logic:**
**Resource Conditions:**
<!-- Specify when this policy should apply -->
- Environment: [ ] Production [ ] Staging [ ] Development [ ] All
- Data Classification: [ ] Public [ ] Internal [ ] Confidential [ ] Restricted
- Cost Center: ___________
- Other conditions: ___________

**Exception Handling:**
<!-- Describe any legitimate business cases that should be exempted -->

## 🚀 Implementation Plan

**Rollout Strategy:**
- [ ] Immediate enforcement
- [ ] Phased rollout (audit → enforce)
- [ ] Pilot with specific teams first
- [ ] A/B testing approach
- [ ] Blue-green deployment
- [ ] Other: ___________

**Testing Requirements:**
- [ ] Syntax validation
- [ ] Logic testing with sample resources
- [ ] Impact analysis on existing resources
- [ ] User acceptance testing
- [ ] Performance testing

**Rollback Plan:**
<!-- How to quickly revert if issues occur -->

## 👥 Stakeholder Communication

**Notification Required:**
- [ ] Security team
- [ ] Compliance team
- [ ] Affected business units
- [ ] Development teams
- [ ] Operations teams
- [ ] Executive leadership
- [ ] External auditors

**Communication Timeline:**
- Advance notice period: _____ days
- Training sessions needed: [ ] Yes [ ] No
- Documentation updates required: [ ] Yes [ ] No

## ✅ Success Criteria

**Measurable Outcomes:**
- [ ] Policy successfully prevents target violations
- [ ] No impact on legitimate business operations
- [ ] Audit trail captures all relevant events
- [ ] Exception process works for legitimate cases
- [ ] Compliance requirement satisfied
- [ ] Cost reduction achieved: $______*
- [ ] Security incidents reduced by: ____%*
- [ ] Process efficiency improved by: ____%*

**Monitoring & Alerting:**
- [ ] Real-time violation alerts configured
- [ ] Compliance dashboard updated
- [ ] Monthly effectiveness review scheduled
- [ ] Quarterly policy review scheduled

## 📅 Timeline Requirements

**Business Deadline:** <!-- Any deadline driven by audits, compliance, or business needs -->
**Preferred Implementation Date:** 
**Latest Acceptable Date:**

**Dependencies:**
<!-- Any dependencies on other policies, approvals, or system changes -->

## 🔍 Additional Context

**Related Policies:**
<!-- Links to existing policies that might conflict or complement -->

**Previous Similar Requests:**
<!-- Reference to similar policy requests or implementations -->

**Regulatory References:**
<!-- Specific regulatory citations or requirements -->

---

**For Policy Review Team:**
- [ ] Business justification approved
- [ ] Technical feasibility confirmed
- [ ] Security review completed
- [ ] Compliance alignment verified
- [ ] Stakeholder communication planned
- [ ] Implementation timeline approved

---

*All financial figures, percentages, and metrics marked with asterisks (*) are example values for demonstration purposes. Actual results will vary based on organizational requirements, implementation approach, and existing infrastructure.*
