provider "aws" {
  region = "us-east-1"
}

# Snapshot of current DB
resource "aws_db_snapshot" "prod_snapshot" {
  db_instance_identifier = "database-1"   # your current DB
  db_snapshot_identifier = "database-1-snapshot"
}

# Restore snapshot into new DB instance
resource "aws_db_instance" "copy_db" {
  identifier              = "database-1-copy"
  snapshot_identifier     = aws_db_snapshot.prod_snapshot.id
  instance_class          = "db.t3.micro"
  publicly_accessible     = true
  skip_final_snapshot     = true
}
