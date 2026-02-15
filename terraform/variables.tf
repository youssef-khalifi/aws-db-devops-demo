variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "old_db_identifier" {
  description = "Identifier of the old DB to snapshot"
  default     = "database-1"
}

variable "new_db_identifier" {
  description = "Identifier for the new DB copy"
  default     = "database-1-copy"
}

variable "db_instance_class" {
  description = "RDS instance type"
  default     = "db.t3.micro"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs for the new DB"
  type        = list(string)
  default     = ["sg-0255fbf36d40e86c1"]  # replace with your old DB SG
}

variable "db_subnet_group_name" {
  description = "DB subnet group to use for the new DB"
  default     = "default"  # replace if needed
}
