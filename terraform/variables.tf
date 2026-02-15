variable "source_db_identifier" {
  description = "Original RDS DB"
  type        = string
  default     = "database-1"
}

variable "subnet_ids" {
  description = "Subnets for DB subnet group"
  type        = list(string)

  default = [
    "subnet-08ad523b816584149",
    "subnet-0adc1eec23ec7b71c"
  ]
}

variable "vpc_security_group_ids" {
  description = "Security groups for DB"
  type        = list(string)

  default = [
    "sg-0255fbf36d40e86c1"
  ]
}
