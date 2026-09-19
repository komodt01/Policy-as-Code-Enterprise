# Technical Case Study — Enterprise Policy-as-Code Framework

## Technical Summary

This project demonstrates an AWS-focused Policy-as-Code architecture for translating repeatable enterprise governance requirements into version-controlled preventive controls.

The implementation uses:

* AWS Organizations Service Control Policies (SCPs)
* Terraform for policy definition management
* GitHub for version control and change governance
* GitHub Actions for automated validation
* tfsec and Checkov for infrastructure security analysis
* Python for lightweight SCP analysis

The architecture separates **automated enforcement from contextual risk decisions**. Requirements that are sufficiently clear and technically enforceable can become automated guardrails, while exceptions, compensating controls, business impact, and risk acceptance remain part of architecture and governance review.

---

## Architecture Problem

Enterprise cloud governance becomes difficult to scale when security requirements depend heavily on:

* Manual architecture reviews
* Individual interpretation of security standards
* Repetitive security findings
* Late-stage configuration reviews
* Manually collected evidence
* Inconsistent exception handling

The architectural challenge is not simply to automate more security controls.

The challenge is determining:

> Which security decisions can be safely converted into automated guardrails, and which decisions still require contextual architecture and risk review?

---

## Architecture Objectives

The project was designed around six objectives:

1. Translate repeatable governance requirements into version-controlled technical policies.
2. Apply preventive controls where requirements are sufficiently clear for automated enforcement.
3. Validate policy and infrastructure changes before enforcement.
4. Preserve human review for contextual risk decisions.
5. Maintain traceability between governance requirements and technical implementation.
6. Limit enforcement blast radius through deliberate deployment and attachment decisions.

---

## Architecture Overview

The implemented control flow is:

**Security Requirement**

↓

**Policy Definition**

↓

**Git Version Control**

↓

**GitHub Actions Validation**

↓

**Terraform**

↓

**AWS Organizations SCP**

↓

**Controlled Enforcement Decision**

Policy creation and policy enforcement are intentionally separated.

Terraform manages the SCP definitions, but the project does not automatically attach the policies to AWS organizational units or accounts.

This creates an explicit governance point between **technically valid policy** and **enterprise enforcement**.

---

## AWS Organizations Service Control Policies

Three SCP definitions represent different governance concerns.

### Security Baseline Policy

The Security Baseline Policy establishes selected foundational security guardrails.

Controls include:

* Requiring environment metadata for EC2 launches
* Preventing CloudTrail disablement
* Preventing AWS Config disablement
* Preventing GuardDuty disablement
* Preventing Security Hub disablement

These controls assume that centrally governed security services have already been established where applicable.

The project does not deploy CloudTrail, AWS Config, GuardDuty, or Security Hub.

The SCP demonstrates how organization-level governance can protect those capabilities from unauthorized disablement.

---

### Cost Controls Policy

The Cost Controls Policy demonstrates preventive financial and resource-governance controls.

Controls include:

* Restricting selected high-cost EC2 instance types
* Requiring cost-center metadata
* Requiring project metadata
* Requiring environment metadata
* Restricting selected AWS regions
* Restricting large EBS volume creation without approved governance metadata

The architecture deliberately avoids using SCPs for every cost-management requirement.

Capabilities such as:

* Automatic shutdown
* Resource scheduling
* Budget management
* Cost anomaly detection
* Resource optimization

would be better implemented through other AWS services, automation, or FinOps processes.

---

### Data Protection Policy

The Data Protection Policy establishes selected preventive data-security boundaries.

Controls include:

* Requiring KMS-backed server-side encryption for S3 object uploads
* Preventing insecure transport to S3
* Restricting public S3 ACLs
* Requiring encryption when creating RDS databases
* Preventing publicly accessible RDS database creation
* Restricting workload activity to selected AWS regions

The policy intentionally does not attempt to provide a complete data-protection architecture.

Additional capabilities such as:

* Data classification
* Sensitive-data discovery
* DLP
* Key lifecycle management
* Retention enforcement
* Access logging
* Continuous configuration monitoring

would require additional services and controls.

---

## Terraform Implementation

Terraform manages the three AWS Organizations SCP definitions:

* `aws_organizations_policy.security_baseline`
* `aws_organizations_policy.cost_controls`
* `aws_organizations_policy.data_protection`

Each Terraform resource loads its policy logic from the corresponding JSON document under:

`policies/aws/scp/`

This separates the policy definition from the Terraform infrastructure configuration while keeping both under version control.

Terraform outputs expose:

* Security Baseline Policy ID
* Cost Controls Policy ID
* Data Protection Policy ID
* Consolidated map of managed SCP policy IDs

This provides a repeatable mechanism for managing the policy definitions without automatically expanding their enforcement scope.

---

## Policy Definition vs. Policy Attachment

One of the most important architecture decisions in the project is the separation of **policy creation from policy attachment**.

Terraform creates and manages the SCP definitions but does not automatically attach them to organizational units or AWS accounts.

This is deliberate.

An SCP can change the effective permission boundary across multiple AWS accounts. A syntactically valid policy can therefore still cause significant operational impact if its scope or logic is incorrect.

The intended lifecycle is:

**Define → Validate → Review → Test → Approve → Attach → Observe → Expand**

This provides a governance checkpoint before preventive controls affect workloads.

---

## CI Validation

GitHub Actions provides automated validation when Terraform or policy files change.

The Policy Validation Pipeline performs:

* AWS SCP JSON syntax validation
* Terraform formatting checks
* Terraform initialization without backend configuration
* Terraform configuration validation
* Validation-report generation

These checks determine whether the policy documents and Terraform configuration meet defined structural requirements.

They do not determine whether a policy:

* Is appropriate for every workload
* Has acceptable business impact
* Is ready for organization-wide enforcement
* Meets every regulatory requirement
* Is operationally safe in every AWS account

Those decisions require additional testing and architecture review.

---

## Security Analysis

A separate GitHub Actions workflow performs security analysis using:

* tfsec
* Checkov
* Python-based SCP analysis

### tfsec

tfsec analyzes Terraform configuration for known security-related infrastructure patterns.

### Checkov

Checkov performs additional static analysis of the Terraform configuration against security and configuration rules.

### Python SCP Analysis

A lightweight Python component examines SCP documents for selected structural security concerns.

The Python analysis is intentionally limited and does not claim to provide comprehensive AWS policy validation.

---

## Security Scan Enforcement Model

tfsec and Checkov currently operate as **reporting controls rather than blocking gates**.

The workflow captures findings but does not automatically fail because a scanner identifies an issue.

This is a deliberate distinction between:

**Detection**

and

**Enforcement**

A scanner finding may represent:

* A legitimate vulnerability
* A configuration weakness
* A contextual risk
* A false positive
* An accepted exception
* A control that requires further investigation

Findings therefore require review before determining whether remediation or enforcement is appropriate.

A mature implementation could later convert selected high-confidence findings into blocking gates once severity thresholds, exception handling, and operational impact are understood.

---

## Preventive vs. Detective Controls

A central architecture decision was determining which requirements should become SCPs.

### Preventive Controls

Preventive enforcement is appropriate when:

* The requirement is clearly defined
* AWS can reliably evaluate the required condition
* Violation creates meaningful risk
* Expected behavior is consistent across the governed scope
* Legitimate exceptions are understood
* Blocking the action is operationally acceptable

Examples demonstrated in the project include:

* Preventing security-service disablement
* Preventing insecure S3 transport
* Preventing selected public-access configurations
* Requiring selected encryption controls
* Restricting selected high-cost resources

---

### Detective Controls

Some requirements require context that makes preventive enforcement inappropriate.

Examples include:

* Configuration drift
* Resource lifecycle management
* Complex data-classification requirements
* Logging configuration quality
* Retention requirements
* Resource optimization
* Controls requiring workload-specific context

Potential mechanisms include:

* AWS Config
* Security Hub
* EventBridge automation
* SIEM monitoring
* Cloud-native security services
* Architecture review

The architectural principle is:

> Use the control mechanism that best matches the risk and enforcement requirement rather than forcing every governance requirement into an SCP.

---

## Architecture Review Integration

Policy-as-Code complements architecture governance rather than replacing it.

A recurring security finding identified through architecture review can follow this lifecycle:

**Architecture Review**

↓

**Recurring Risk**

↓

**Enterprise Security Standard**

↓

**Policy-as-Code Requirement**

↓

**Automated Validation**

↓

**Controlled Enforcement**

This allows repeatable architecture decisions to become reusable guardrails.

Architecture review can then focus more heavily on:

* Exceptions
* Novel risks
* Business tradeoffs
* New technologies
* Compensating controls
* Cross-domain dependencies
* Risk acceptance

rather than repeatedly evaluating the same established requirement.

---

## Exception Architecture

Preventive controls require a defined exception process.

An exception should identify:

* Affected policy
* Affected workload or account
* Business justification
* Security risk
* Compensating controls
* Accountable owner
* Approval authority
* Expiration date
* Remediation plan

Exceptions should not silently weaken the enterprise baseline.

They should represent explicit and traceable risk decisions.

---

## Security Decision Traceability

The architecture supports a governance chain from requirement through enforcement:

**Business or Regulatory Requirement**

↓

**Enterprise Security Standard**

↓

**Architecture Requirement**

↓

**Policy-as-Code Control**

↓

**Terraform-Managed Policy**

↓

**Automated Validation**

↓

**Architecture / Security Review**

↓

**Controlled Enforcement**

↓

**Monitoring Evidence**

↓

**Exception or Risk Decision**

This provides traceability between business requirements, architecture decisions, technical controls, and governance outcomes.

---

## Compliance Considerations

The architecture can support technical controls and evidence associated with frameworks such as:

* NIST Cybersecurity Framework
* NIST SP 800-53
* PCI DSS
* ISO/IEC 27001
* HIPAA security requirements
* SOX-related technology controls

Policy-as-Code does not establish compliance by itself.

Compliance depends on the broader combination of:

* Governance
* People
* Processes
* Technical controls
* Evidence
* Operating effectiveness
* Organizational scope
* Risk management

Passing an automated policy-validation pipeline therefore should not be interpreted as proof of regulatory compliance.

---

## Multi-Cloud Considerations

The implemented technical foundation is AWS-focused.

Comparable governance patterns could use provider-native capabilities such as:

| Cloud Provider  | Governance Mechanism                   |
| --------------- | -------------------------------------- |
| AWS             | Organizations Service Control Policies |
| Microsoft Azure | Azure Policy and Management Groups     |
| Google Cloud    | Organization Policy Service            |

The governance principles can remain consistent across cloud providers, but their technical implementations differ.

Policy syntax, inheritance, available conditions, exception mechanisms, and enforcement behavior are provider-specific.

Azure and Google Cloud are therefore treated as **reference architecture extensions**, not implemented components of this project.

---

## Architecture Decisions and Tradeoffs

### Native AWS Governance Controls

AWS Organizations SCPs provide centralized preventive governance.

**Benefit:** Consistent organization-level permission boundaries.

**Tradeoff:** Incorrect controls can have a large blast radius.

---

### Terraform-Managed Policies

Terraform provides repeatability, version control, and reviewability.

**Benefit:** Policy definitions become part of a controlled infrastructure lifecycle.

**Tradeoff:** Terraform validation cannot determine whether a policy is appropriate for every workload.

---

### Separate Definition from Attachment

Policies are managed without automatic account or OU attachment.

**Benefit:** Creates a deliberate review point before enforcement.

**Tradeoff:** Additional steps are required to move a policy into enforcement.

---

### CI Validation Before Enforcement

GitHub Actions validates policy and Terraform changes.

**Benefit:** Structural problems can be identified earlier.

**Tradeoff:** Automated validation cannot replace behavioral testing or architecture review.

---

### Non-Blocking Security Scanning

tfsec and Checkov initially operate as reporting controls.

**Benefit:** Findings can be evaluated for severity, applicability, and false positives before blocking thresholds are established.

**Tradeoff:** Scanner findings do not automatically stop a change.

---

### Multiple Control Types

Not every governance requirement is implemented through an SCP.

**Benefit:** Controls are selected according to their technical suitability and required enforcement point.

**Tradeoff:** Enterprise governance requires coordination across multiple security services and control mechanisms.

---

## Risks and Mitigations

| Risk                             | Architectural Response                                                       |
| -------------------------------- | ---------------------------------------------------------------------------- |
| Excessively restrictive SCP      | Separate policy definition from attachment                                   |
| Organization-wide blast radius   | Use limited scope and phased enforcement                                     |
| Incorrect policy logic           | Combine automated validation with behavioral testing and architecture review |
| Scanner false positives          | Review findings before converting them into blocking gates                   |
| Uncontrolled exceptions          | Require explicit ownership, approval, expiration, and compensating controls  |
| Configuration drift              | Supplement preventive controls with detective monitoring                     |
| False confidence from automation | Separate validation results from security and compliance conclusions         |
| Multi-cloud inconsistency        | Maintain common governance principles while using provider-native controls   |

---

## Implementation Boundaries

This is a portfolio architecture project demonstrating an AWS Policy-as-Code foundation.

It does not represent a production enterprise environment.

Current boundaries include:

* AWS-focused technical implementation
* Three Terraform-managed SCP definitions
* No automatic SCP attachment to accounts or organizational units
* No claim of production deployment
* No claim of regulatory certification
* tfsec and Checkov operate as reporting controls
* CloudTrail, AWS Config, GuardDuty, and Security Hub are referenced by protective governance controls but are not deployed by this Terraform configuration
* Azure and Google Cloud remain reference architecture extensions

These boundaries distinguish demonstrated implementation from production architecture recommendations.

---

## Architecture Lessons

The project demonstrates several broader security architecture principles:

1. Policy-as-Code is a governance capability, not simply an automation technique.
2. Technical validity does not establish business suitability.
3. Preventive controls require explicit consideration of blast radius.
4. Not every security requirement belongs in an SCP.
5. Detection and enforcement are separate architecture decisions.
6. Scanner findings require risk context before becoming blocking gates.
7. Exceptions should be designed as part of the governance architecture.
8. Native cloud controls should be used according to their actual technical capabilities.
9. Architecture review remains necessary even as governance becomes increasingly automated.

---

## Key Takeaway

A mature Policy-as-Code architecture does not attempt to automate every security decision.

It converts **repeatable, technically enforceable requirements into consistent guardrails** while preserving architecture review, exception management, risk acceptance, and operational oversight for decisions that require context.

The goal is not maximum automation.

The goal is **scalable, traceable, risk-based governance**.
