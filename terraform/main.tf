provider "aws" {
  region = "us-east-1"
}

############################
# 1. Create DB Subnet Group
############################

resource "aws_db_subnet_group" "new_db_subnet_group" {
  name       = "new-db-subnet-group-demo"
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
  db_snapshot_identifier = "${var.source_db_identifier}-snapshot-demo"
}

############################
# 3. Restore snapshot into NEW DB instance
############################

resource "aws_db_instance" "copy_db" {
  identifier              = "${var.source_db_identifier}-copy"
  snapshot_identifier     = aws_db_snapshot.prod_snapshot.id
  instance_class          = "db.t3.micro"

  publicly_accessible     = true
  skip_final_snapshot     = true

  db_subnet_group_name    = aws_db_subnet_group.new_db_subnet_group.name
  vpc_security_group_ids  = var.vpc_security_group_ids
}
