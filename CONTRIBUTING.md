# Contributing to the Enterprise Policy-as-Code Framework

## Overview

This project demonstrates security architecture and cloud governance concepts using Policy-as-Code.

Changes should support the project's primary objectives:

* Translate security and governance requirements into repeatable cloud controls
* Maintain clear traceability between requirements and implementation
* Apply risk-based preventive and detective controls
* Preserve appropriate architecture review and human governance
* Document implementation decisions, limitations, and tradeoffs

---

## Development Environment

Recommended tooling:

* Terraform 1.5 or later
* AWS CLI v2
* Git
* GitHub
* Linux or WSL environment

Changes should be tested and validated before being proposed for inclusion.

---

## Contribution Process

1. Create a working branch.
2. Identify the business, security, compliance, or architecture requirement being addressed.
3. Update the applicable policy, Terraform configuration, workflow, or documentation.
4. Validate the proposed change.
5. Evaluate security and operational impact.
6. Document potential exceptions or compensating controls where applicable.
7. Submit a pull request using the repository's Pull Request Template.
8. Complete the required architecture and technical review before merging.

---

## Policy Changes

New or modified governance policies should clearly identify:

* The risk or requirement being addressed
* The intended governance outcome
* The proposed enforcement type
* The scope of enforcement
* Potential operational impact
* Expected exception scenarios
* Required monitoring
* Testing and rollback considerations

Preventive controls require particular attention because an incorrect policy may affect multiple accounts or workloads.

---

## Infrastructure-as-Code Standards

Terraform changes should:

* Be version controlled
* Use clear resource and variable naming
* Avoid hardcoded sensitive information
* Include appropriate variable definitions
* Maintain understandable configuration structure
* Be reviewed through Terraform plan before deployment
* Document significant architecture decisions or dependencies

---

## Security and Governance Principles

Contributions should follow several core principles.

### Automate Repeatable Decisions

Policy-as-Code should automate requirements that are sufficiently clear, consistent, and technically enforceable.

### Preserve Human Risk Decisions

Exceptions, compensating controls, business impact, and risk acceptance may require architecture or governance review rather than automatic enforcement.

### Minimize Blast Radius

High-impact preventive controls should be tested in limited scope before broader enforcement.

### Maintain Traceability

Policies should be traceable to a security requirement, architecture decision, enterprise standard, risk, or compliance requirement whenever possible.

### Design for Exceptions

Enterprise governance should assume legitimate exceptions will occur and provide a controlled mechanism for evaluating and approving them.

---

## Documentation

Documentation should accurately distinguish between:

* Implemented capabilities
* Architecture recommendations
* Reference designs
* Future enhancements

Do not present hypothetical outcomes, projected savings, compliance status, or production capabilities as demonstrated results.

---

## Review

Significant changes should consider review by the appropriate stakeholders, which may include:

* Security Architecture
* Cloud or Platform Engineering
* Security Engineering
* Operations
* Risk and Compliance
* Application Owners
* Business Owners

The level of review should correspond to the risk, scope, and potential operational impact of the change.

---

## Questions and Architecture Decisions

Use the repository's issue and policy-request process to document questions, proposed governance changes, architecture decisions, or implementation concerns.

The goal is to preserve not only **what changed**, but also **why the change was appropriate**.
