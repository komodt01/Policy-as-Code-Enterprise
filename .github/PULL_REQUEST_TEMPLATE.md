# Change Summary

**Change Type:**

* [ ] New policy implementation
* [ ] Existing policy modification
* [ ] Policy removal or deprecation
* [ ] Terraform / infrastructure change
* [ ] Governance or compliance change
* [ ] Documentation update
* [ ] Other: __________

**Related Policy Request / Issue:**

**Change Owner:**

---

## Business Justification

**Business Driver:**

Describe the business, security, compliance, operational, or architecture requirement driving this change.

**Expected Business Value:**

Describe the expected value without assuming or inventing measurable outcomes.

Examples may include:

* Reduced security risk
* More consistent cloud governance
* Earlier identification of configuration issues
* Improved control traceability
* Reduced repetitive architecture review
* Improved compliance evidence
* Clearer security requirements for engineering teams

**Impact if Change Is Not Implemented:**

---

## Security and Risk Impact

**Risk Addressed:**

**Security Requirement:**

**Existing Control, if any:**

**Risk Level:** Low / Medium / High / Critical

### Control Type

* [ ] Preventive
* [ ] Detective
* [ ] Advisory
* [ ] No change to enforcement

**Why is this enforcement type appropriate?**

---

## Architecture Impact

**Governance Scope:**

* [ ] AWS Organization
* [ ] Organizational Unit
* [ ] AWS Account
* [ ] Environment
* [ ] Resource type
* [ ] Workload
* [ ] Other: __________

**Architecture Components Affected:**

**Trust / Security Boundary Impact:**

**Potential Blast Radius:**

**Dependencies:**

---

## Technical Changes

### Policy Changes

**Policies Affected:**

* [ ] Security baseline
* [ ] Data protection
* [ ] Cost / resource governance
* [ ] Access or identity governance
* [ ] Custom policy: __________
* [ ] No policy change

**Previous Behavior:**

**Proposed Behavior:**

### Infrastructure Changes

**Terraform Changes:**

* [ ] New resources
* [ ] Existing resources modified
* [ ] Resources removed
* [ ] Configuration only
* [ ] No Terraform changes

**AWS Resources / Services Affected:**

---

## Exception Impact

**Could this change require exceptions?**

* [ ] No
* [ ] Yes
* [ ] Unknown — requires further review

If yes:

**Expected Exception Scenario:**

**Compensating Control Available:**

**Risk Acceptance Required:**

**Exception Owner / Approval Authority:**

A new preventive control should not be broadly enforced until likely exception scenarios and operational dependencies have been evaluated.

---

## Testing and Validation

**Validation Completed:**

* [ ] Policy syntax validated
* [ ] Terraform validation completed
* [ ] Terraform plan reviewed
* [ ] Policy logic tested
* [ ] Expected allowed behavior tested
* [ ] Expected denied behavior tested
* [ ] Security implications reviewed
* [ ] Exception scenario tested where applicable
* [ ] Documentation updated

**Test Results:**

**Known Limitations:**

---

## Deployment Strategy

### Proposed Rollout

* [ ] Limited-scope testing
* [ ] Non-production validation
* [ ] Selected account / organizational unit
* [ ] Detective or observation period before enforcement
* [ ] Phased expansion
* [ ] Organization-wide deployment
* [ ] Documentation-only change

Recommended approach for significant preventive controls:

**Develop → Validate → Test → Limited Scope → Observe → Expand**

**Initial Scope:**

**Expansion Criteria:**

---

## Rollback Plan

**Rollback Trigger:**

Examples:

* Legitimate workload disruption
* Unexpected denied actions
* Incorrect policy behavior
* Excessive exception requests
* Unanticipated dependency
* Availability impact

**Rollback Procedure:**

**Responsible Owner:**

---

## Monitoring and Evidence

**Monitoring Required:**

* [ ] AWS CloudTrail
* [ ] AWS Config
* [ ] Policy evaluation results
* [ ] Terraform / CI pipeline results
* [ ] Operational monitoring
* [ ] Exception tracking
* [ ] Other: __________
* [ ] Not applicable

**Evidence to Retain:**

**Post-Deployment Review Required:** Yes / No

---

## Compliance and Standards Alignment

**Applicable Framework / Standard:**

* [ ] NIST Cybersecurity Framework
* [ ] NIST SP 800-53
* [ ] PCI DSS
* [ ] ISO/IEC 27001
* [ ] HIPAA Security Rule
* [ ] SOX-related technology controls
* [ ] Internal security standard
* [ ] Contractual / customer requirement
* [ ] Other: __________
* [ ] Not applicable

**Relevant Requirement / Control:**

A policy change may support a compliance requirement but should not be treated as establishing compliance by itself.

---

## Stakeholder Impact

**Review / Notification Required:**

* [ ] Security Architecture
* [ ] Cloud / Platform Engineering
* [ ] Security Engineering
* [ ] Operations
* [ ] Risk / Compliance
* [ ] Application Owner
* [ ] Business Owner
* [ ] Other: __________

**Communication Requirements:**

---

## Architecture Decision

**Architecture Review Required:** Yes / No

**Decision:**

* [ ] Approved
* [ ] Approved with conditions
* [ ] Revision required
* [ ] Rejected
* [ ] Not applicable

**Decision Rationale:**

**Conditions / Compensating Controls:**

**Decision Owner:**

---

## Pre-Merge Checklist

### Author

* [ ] Business justification documented
* [ ] Security risk identified
* [ ] Architecture impact evaluated
* [ ] Policy scope documented
* [ ] Testing completed
* [ ] Exception impact considered
* [ ] Rollback plan defined
* [ ] Monitoring requirements identified
* [ ] Documentation updated

### Security / Architecture Reviewer

* [ ] Control addresses the stated risk
* [ ] Preventive vs. detective approach is appropriate
* [ ] Enforcement scope is appropriate
* [ ] Blast radius has been considered
* [ ] Exception requirements are understood
* [ ] Compensating controls are identified where necessary
* [ ] Testing is appropriate for the change
* [ ] Rollback approach is feasible

### Technical Reviewer

* [ ] Terraform / policy implementation is valid
* [ ] Dependencies are understood
* [ ] Expected allow behavior is preserved
* [ ] Expected deny behavior functions as intended
* [ ] Monitoring and evidence requirements can be supported

---

## Final Principle

**Policy changes should be evaluated as architecture decisions, not simply code changes.**

Before an automated guardrail is introduced or modified, the organization should understand the risk being addressed, enforcement scope, operational impact, exception requirements, testing strategy, rollback path, and accountable decision owner.
