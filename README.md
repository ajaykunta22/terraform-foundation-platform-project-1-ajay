
# AWS Boot Camp – Project 1: Foundation Platform

## 1. Project Overview

This project is part of the AWS Boot Camp production-grade project series.

The objective of Project 1 is to design and implement a repeatable, cost-controlled AWS foundation platform using Infrastructure as Code.

The project focuses on:

- Terraform-based Infrastructure as Code
- Terraform Cloud / HCP remote execution
- GitHub version control
- Modular Terraform structure
- Environment-based configuration
- AWS networking foundation
- Cost optimization and tagging standards

The current implementation focuses on the Dev environment.

---

## 2. Architecture Overview

This project follows a Terraform Cloud VCS-driven workflow.

```text
Visual Studio Code
      ↓
Git Commit / Push
      ↓
GitHub Repository
      ↓
Terraform Cloud Workspace
      ↓
Remote Terraform Plan / Apply
      ↓
AWS Cloud Infrastructure
AWS Cloud
└── Region: us-east-1
    └── VPC: 10.0.0.0/16
        ├── Public Subnet 1: 10.0.1.0/24   us-east-1a
        ├── Public Subnet 2: 10.0.2.0/24   us-east-1b
        ├── Private Subnet 1: 10.0.11.0/24 us-east-1a
        ├── Private Subnet 2: 10.0.12.0/24 us-east-1b
        ├── Internet Gateway
        └── Public Route Table
            └── 0.0.0.0/0 → Internet Gateway

            terraform-foundation-platform-project-1-ajay/
│
├── .github/
├── scripts/
├── .gitignore
├── README.md
│
├── environments/
│   ├── dev.auto.tfvars
│   ├── qa.auto.tfvars
│   ├── stage.auto.tfvars
│   └── prod.auto.tfvars
│
├── infrastructure/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── backend.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── qa/
│   └── prod/
│
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── ec2/
    ├── s3/
    └── iam/

    1. Code is written in Visual Studio Code
2. Changes are committed to a Git feature branch
3. Code is pushed to GitHub
4. Terraform Cloud pulls the repository through VCS integration
5. Terraform Cloud runs terraform init and terraform plan remotely
6. AWS resources are planned and managed through Terraform Cloud

Execution mode: Remote
Working directory: infrastructure/dev
Environment: Dev

<project-name>-<environment>-<service>
foundation-platform-dev-vpc
foundation-platform-dev-public-subnet-1
foundation-platform-dev-private-subnet-1
Project
Environment
Owner
CostCenter