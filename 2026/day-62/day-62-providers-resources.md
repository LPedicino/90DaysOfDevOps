# Day 62 -- Providers, Resources and Dependencies

## Overview
Building a complete networking stack on AWS using Terraform, connecting VPCs, subnets, internet gateways, route tables, security groups, and an EC2 instance while managing resource dependency graphs.

---

## Task 1: AWS Provider Version Pinning

### What does `~> 5.0` mean?
The pessimistic constraint operator `~> 5.0` allows the rightmost version component to increment. It permits any version `>= 5.0` but strictly less than `6.0` (e.g., `5.1`, `5.75`, but not `6.0`).

### Comparison of Version Constraints
* **`~> 5.0`**: Allows bug fixes and minor updates within the major version 5 (equivalent to `>= 5.0, < 6.0`).
* **`>= 5.0`**: Allows version 5.0 and any higher version indefinitely, including major breaking changes like version 6.0 or 7.0.
* **`= 5.0.0`**: Pins the provider to an exact specific version. No upgrades or patches are permitted automatically.

---

## Task 2 & 4: Full `main.tf` Configuration

```hcl
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# 1. Create VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "TerraWeek-VPC"
  }
}

# 2. Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "TerraWeek-Public-Subnet"
  }
}

# 3. Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "TerraWeek-IGW"
  }
}

# 4. Create Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "TerraWeek-Route-Table"
  }
}

# 5. Associate Route Table with Subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_id       = aws_route_table.public.id
}

# 6. Create Security Group
resource "aws_security_group" "web_sg" {
  name        = "terraweek-web-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TerraWeek-SG"
  }
}

# 7. Create EC2 Instance
resource "aws_instance" "main" {
  ami                         = "ami-0c7217cdde317cfec" # Example Amazon Linux 2 AMI
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }

  tags = {
     Name = "TerraWeek-Server"
   }
 }
```

### Task 3: Implicit vs. Explicit Dependencies

#### Implicit Dependencies
Terraform automatically builds a Directed Acyclic Graph (DAG) based on resource attribute references (e.g., `aws_subnet.public` referencing `aws_vpc.main.id`).

* **How it knows the order:** Terraform analyzes expressions in the HCL code. Since the subnet cannot exist without a VPC ID, Terraform automatically knows the VPC must be created first.
* **If attempted manually out of order:** Creating a subnet before the VPC would fail because the AWS API requires a valid existing VPC ID.

#### Explicit Dependencies (`depends_on`)
Used when Terraform cannot automatically detect a resource relationship because no attributes are passed directly between them.

* **Real-world examples:**
  * Forcing an S3 bucket logging configuration to apply only after an IAM access policy resource is fully attached.
  * Ensuring a database migration Lambda function runs strictly after the database cluster resource finishes initializing, even if the Lambda code references an environment variable string instead of direct resource interpolation.

### Task 6: Terraform Lifecycle Arguments

* **`create_before_destroy`**: Instructs Terraform to provision a replacement resource first and verify it works before deleting the old one. Useful for minimizing downtime during server or container migrations.
* **`prevent_destroy`**: A safety guardrail that blocks Terraform from destroying a critical resource (like a production RDS database or core VPC).
* **`ignore_changes`**: Tells Terraform to ignore specific attribute modifications made outside of Terraform (e.g., tags updated manually by another tool or auto-scaling tags).
