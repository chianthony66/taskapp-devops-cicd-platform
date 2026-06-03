# Terraform Infrastructure

This directory contains the Infrastructure as Code (IaC) implementation for the TaskApp DevOps CI/CD Platform.

The infrastructure is provisioned on AWS using Terraform and follows a modular architecture designed for scalability, maintainability, and reusability. The project demonstrates industry-standard Terraform practices including remote state management, state locking, network segmentation, and reusable modules.

---

## Overview

The Terraform configuration provisions the AWS infrastructure required to host the TaskApp platform.

Provisioned resources include:

- Virtual Private Cloud (VPC)
- Public and Private Subnets
- Internet Gateway
- Route Tables
- Security Groups
- Frontend EC2 Instance
- Backend EC2 Instance
- PostgreSQL Database (RDS)
- Remote Terraform State Backend

The infrastructure is designed to separate networking, compute, and database concerns using reusable Terraform modules.

---

## Infrastructure Architecture

The infrastructure follows a layered architecture:

```text
AWS
│
├── VPC
│   ├── Public Subnets
│   │   └── Frontend EC2
│   │
│   └── Private Subnets
│       ├── Backend EC2
│       └── PostgreSQL RDS
│
└── Security Groups
    ├── Frontend Access
    ├── Backend Access
    └── Database Access
```

### Key Design Considerations

- Frontend server accessible from the internet
- Backend server isolated from direct public access
- Database deployed in private subnets
- Security Group-based communication between application layers

---

## Repository Structure

```text
terraform/
├── terraform-backend/
├── root/
└── modules/
    ├── core/
    ├── vpc/
    ├── ec2/
    └── rds/
```

---

## Module Structure

### Core Module

**Purpose**

- Shared project configuration
- Common variables and outputs
- Centralized project context

**Location**

```text
modules/core/
```

---

### VPC Module

**Responsible for**

- VPC creation
- Public subnets
- Private subnets
- Internet Gateway
- Route tables
- Security groups

**Location**

```text
modules/vpc/
```

---

### EC2 Module

**Responsible for**

- Frontend EC2 instance
- Backend EC2 instance
- Instance networking configuration
- Security group attachment

**Location**

```text
modules/ec2/
```

---

### RDS Module

**Responsible for**

- PostgreSQL database
- Database subnet groups
- Database security controls

**Location**

```text
modules/rds/
```

---

## Remote State Management

Terraform state is stored remotely to support collaboration and improve reliability.

### Features

- S3 Backend Storage
- DynamoDB State Locking
- State Consistency Protection
- Team Collaboration Support

Backend resources are provisioned separately from the main infrastructure.

**Location**

```text
terraform-backend/
```

---

## Deployment Workflow

### 1. Bootstrap Backend Resources

```bash
cd terraform-backend

terraform init
terraform plan
terraform apply
```

This creates:

- S3 bucket
- DynamoDB table

required for remote state management.

---

### 2. Deploy Infrastructure

```bash
cd ../root

terraform init
terraform plan
terraform apply
```

Terraform provisions:

- Networking
- Compute resources
- Database resources
- Security controls

---

## Security Considerations

The infrastructure follows several security best practices:

- Remote state stored outside local machines
- State locking enabled
- Database isolated within private subnets
- Security Group-based access controls
- Sensitive values managed as variables
- No hardcoded AWS credentials

---

## Key Features

- Modular Terraform architecture
- Reusable infrastructure components
- Remote state management
- State locking with DynamoDB
- AWS networking segmentation
- Secure database deployment
- Infrastructure automation
- Production-oriented design patterns

---

## Common Terraform Commands

### Initialize

```bash
terraform init
```

### Preview Changes

```bash
terraform plan
```

### Deploy Infrastructure

```bash
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

---

## Author

**Anthony Chidi**

*DevOps Engineer | Cloud Engineer | CI/CD & Infrastructure Automation*
