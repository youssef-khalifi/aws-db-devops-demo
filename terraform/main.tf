# Terraform configuration for copying an existing RDS DB

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


resource "aws_db_snapshot" "prod_snapshot" {
  db_instance_identifier = var.old_db_identifier
  db_snapshot_identifier = "${var.old_db_identifier}-snapshot"
}


resource "aws_db_instance" "copy_db" {
  identifier              = var.new_db_identifier
  snapshot_identifier     = aws_db_snapshot.prod_snapshot.id
  instance_class          = var.db_instance_class
  publicly_accessible     = true
  skip_final_snapshot     = true
  db_subnet_group_name    = var.db_subnet_group_name
  vpc_security_group_ids  = var.vpc_security_group_ids

  # Optional: set tags
  tags = {
    Name        = var.new_db_identifier
    Environment = "DevOpsDemo"
  }
}
