# Policy Request & Architecture Review Template

## Purpose

This template provides a structured process for proposing a new Policy-as-Code control or requesting a modification to an existing governance policy.

The objective is to ensure that policy changes begin with a clearly defined **business, security, compliance, or operational requirement** before a technical control is selected.

Not every identified risk should automatically become an enforced policy. Proposed controls should be evaluated for business impact, enforcement strategy, exception requirements, and operational risk before implementation.

---

# 1. Policy Request Summary

**Policy Name:**
**Requestor:**
**Business / Technical Owner:**
**Date Requested:**
**Priority:** Low / Medium / High / Critical
**Policy Type:** Preventive / Detective / Advisory
**Target Environment:**
**Target Cloud Platform:** AWS / Azure / GCP / Other

### Request Summary

Describe the requested policy or modification.

**Requested Outcome:**

**Reason for Request:**

---

# 2. Business Context

## Business Driver

Select the primary driver for the request:

* Security risk reduction
* Regulatory or compliance requirement
* Audit finding
* Security incident or lessons learned
* Architecture review finding
* Cloud governance requirement
* Cost management
* Operational consistency
* Customer requirement
* Business requirement
* Other

### Business Justification

Explain why the policy is needed and what business or security problem it addresses.

**Expected Business Value:**

**Impact if Not Implemented:**

---

# 3. Security and Risk Context

## Risk Being Addressed

Describe the security or operational risk the policy is intended to reduce.

Consider:

* Threat scenario
* Vulnerability or configuration weakness
* Potential affected assets
* Data sensitivity
* Identity or privilege exposure
* Potential business impact
* Likelihood of occurrence

**Risk Description:**

**Potential Business Impact:**

**Existing Controls:**

---

# 4. Compliance and Standards Alignment

Identify applicable requirements.

Potential frameworks include:

* NIST Cybersecurity Framework
* NIST SP 800-53
* PCI DSS
* ISO/IEC 27001
* HIPAA Security Rule
* SOX-related technology controls
* CIS Controls
* Internal security standards
* Contractual or customer requirements
* Other industry-specific requirements

**Applicable Framework / Standard:**

**Relevant Requirement or Control:**

**Enterprise Security Standard:**

Policy implementation should be traceable to the underlying security or business requirement whenever possible.

---

# 5. Technical Requirements

## Proposed Control

Describe the technical behavior required.

**Resources or Services Affected:**

**Required Configuration:**

**Prohibited Configuration or Action:**

**Scope of Enforcement:**

Examples:

* Organization
* Organizational Unit
* Cloud account
* Subscription
* Project
* Environment
* Resource type
* Application

---

# 6. Enforcement Decision

## Proposed Enforcement Type

### Preventive

The control blocks prohibited actions or configurations.

Use preventive enforcement when:

* the requirement is clearly defined,
* the risk is significant,
* exceptions should be uncommon,
* and blocking the action creates acceptable operational impact.

### Detective

The control identifies violations without immediately preventing the action.

Use detective enforcement when:

* business context affects the decision,
* immediate blocking could create operational risk,
* legacy systems require transition time,
* or investigation is required before remediation.

### Advisory

The control provides guidance or visibility but does not automatically block or trigger remediation.

**Recommended Enforcement:** Preventive / Detective / Advisory

**Rationale:**

---

# 7. Architecture Review

Before implementation, evaluate the proposed policy from an enterprise architecture perspective.

### Architecture Questions

**Is the requirement consistent enough to automate?**

**Can the requirement be evaluated technically and reliably?**

**Could enforcement disrupt legitimate workloads?**

**What is the potential blast radius of an incorrect policy?**

**Are existing workloads likely to require exceptions?**

**Should the control block, detect, or alert?**

**Can the requirement be implemented at an organizational level?**

**Would a workload-level control be more appropriate?**

**Does an existing enterprise control already address the risk?**

**Are compensating controls possible?**

---

# 8. Architecture Decision

**Decision:** Approve / Approve with Conditions / Revise / Reject

**Decision Rationale:**

**Selected Control Approach:**

**Selected Enforcement Level:**

**Implementation Scope:**

**Required Conditions:**

---

# 9. Exception Requirements

Determine whether exceptions are expected.

**Exceptions Expected:** Yes / No

If yes:

**Potential Exception Scenario:**

**Business Justification Required:** Yes / No

**Compensating Control Required:** Yes / No

**Risk Acceptance Required:** Yes / No

**Approval Authority:**

**Maximum Exception Duration:**

Every approved exception should identify:

* affected policy,
* affected workload,
* business justification,
* security risk,
* compensating controls,
* accountable owner,
* approving authority,
* expiration date,
* and remediation plan.

Exceptions should be time-bound whenever practical.

---

# 10. Implementation Approach

**Implementation Technology:**

Examples:

* AWS Service Control Policy
* AWS Config
* Azure Policy
* Google Cloud Organization Policy
* Terraform
* CI/CD validation
* Cloud-native monitoring
* Other governance mechanism

**Infrastructure-as-Code Required:** Yes / No

**Automated Validation Required:** Yes / No

**Monitoring Required:** Yes / No

**Logging Requirements:**

---

# 11. Testing Strategy

Before broad enforcement, define how the control will be validated.

### Required Testing

* Policy syntax validation
* Infrastructure validation
* Security validation
* Functional testing
* Negative testing
* Exception testing
* Operational impact testing

### Deployment Strategy

Recommended progression:

**Develop → Validate → Test → Limited Scope → Observe → Expand**

**Initial Test Environment:**

**Initial Enforcement Scope:**

**Success Criteria:**

**Rollback Criteria:**

---

# 12. Operational Impact

Evaluate the effect of the proposed policy on existing environments.

**Affected Teams:**

**Affected Applications / Workloads:**

**Legacy-System Considerations:**

**Potential Service Impact:**

**Potential Deployment Impact:**

**Required Communication:**

**Required Training or Documentation:**

---

# 13. Monitoring and Evidence

Define how effectiveness will be monitored after implementation.

Potential evidence sources include:

* Policy evaluation results
* Terraform plans
* GitHub pull requests
* Deployment records
* AWS CloudTrail
* AWS Config
* Cloud monitoring platforms
* Exception records
* Remediation records

**Monitoring Method:**

**Evidence Source:**

**Review Frequency:**

**Control Owner:**

---

# 14. Policy Lifecycle

Every policy should have an accountable lifecycle.

**Policy Owner:**

**Implementation Date:**

**Last Review Date:**

**Next Review Date:**

**Review Frequency:**

During review, determine whether the policy should be:

* retained,
* modified,
* expanded,
* reduced in scope,
* converted between preventive and detective enforcement,
* or retired.

---

# 15. Final Approval

**Security Architecture:** Approved / Not Approved

**Cloud / Platform Owner:** Approved / Not Approved

**Risk / Compliance Review Required:** Yes / No

**Business Approval Required:** Yes / No

**Exception Process Established:** Yes / No

**Final Decision:**

**Decision Date:**

**Decision Owner:**

---

# Architecture Principle

**A security requirement should become an automated policy only when the organization understands the risk being addressed, the expected business impact, the appropriate enforcement mechanism, and how legitimate exceptions will be governed.**

Policy-as-Code should automate repeatable security decisions.

Architecture review remains responsible for the contextual decisions involving business requirements, risk acceptance, compensating controls, operational impact, and architecture tradeoffs.
