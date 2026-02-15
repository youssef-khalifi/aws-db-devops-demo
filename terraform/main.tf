############################
# Provider configuration
############################
provider "aws" {
  region = var.region
}

############################
# 1. Create DB Subnet Group
############################
resource "aws_db_subnet_group" "new_db_subnet_group" {
  name       = "${var.source_db_identifier}-subnet-group-demo"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "New DB Subnet Group Demo"
  }
}

############################
# 2. Create snapshot of existing DB
############################
resource "aws_db_snapshot" "prod_snapshot" {
  db_instance_identifier = var.source_db_identifier
  db_snapshot_identifier = var.db_snapshot_identifier
}

############################
# 3. Restore snapshot into NEW DB instance
############################
resource "aws_db_instance" "copy_db" {
  identifier              = var.db_copy_identifier
  snapshot_identifier     = aws_db_snapshot.prod_snapshot.id
  instance_class          = "db.t3.micro"

  publicly_accessible     = true
  skip_final_snapshot     = true

  db_subnet_group_name    = aws_db_subnet_group.new_db_subnet_group.name
  vpc_security_group_ids  = var.vpc_security_group_ids

  # Optional: additional settings
  apply_immediately       = true
  auto_minor_version_upgrade = true
}

############################
# Output DB endpoint
############################
output "db_endpoint" {
  value       = aws_db_instance.copy_db.endpoint
  description = "Endpoint of the copied RDS instance"
}
