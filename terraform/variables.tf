# AWS region
variable "region" {
  description = "AWS region for RDS and other resources"
  type        = string
  default     = "us-east-1"
}

# Original RDS DB instance
variable "source_db_identifier" {
  description = "Original RDS DB instance identifier"
  type        = string
  default     = "database-1"
}

# New RDS DB copy identifier
variable "db_copy_identifier" {
  description = "Identifier for the new RDS DB copy"
  type        = string
  default     = "database-1-copy"
}

# Snapshot identifier to create from source DB
variable "db_snapshot_identifier" {
  description = "Snapshot identifier for the source DB"
  type        = string
  default     = "database-1-snapshot"
}

# Subnets for DB subnet group
variable "subnet_ids" {
  description = "Subnets for DB subnet group"
  type        = list(string)
  default = [
    "subnet-08ad523b816584149",
    "subnet-0adc1eec23ec7b71c"
  ]
}

# Security groups for DB
variable "vpc_security_group_ids" {
  description = "Security groups for DB"
  type        = list(string)
  default = [
    "sg-0255fbf36d40e86c1"
  ]
}
