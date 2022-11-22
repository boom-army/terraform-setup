# create the RDS instance
resource "aws_db_instance" "rds_instance" {
  identifier                  = var.rds_identifier
  allocated_storage           = var.rds_allocated_storage
  storage_type                = var.rds_storage_type
  iops                        = var.rds_iops
  multi_az                    = true
  engine                      = var.rds_engine
  engine_version              = var.rds_engine_version
  instance_class              = var.rds_instance_type
  name                        = var.rds_database_name
  username                    = var.rds_username
  password                    = var.rds_password
  port                        = var.postgres_db_port
  vpc_security_group_ids      = [aws_security_group.rds_sg.id, aws_security_group.ecs_sg.id]
  parameter_group_name        = "default.postgres12"
  db_subnet_group_name        = aws_db_subnet_group.db_subnet_group.name # id
  publicly_accessible         = true                                     # true(if required)
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  apply_immediately           = true
  storage_encrypted           = false
  skip_final_snapshot         = true
  final_snapshot_identifier   = var.rds_final_snapshot_identifier
  deletion_protection         = false
  # enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  ## disable backups to create DB faster
  # maintenance_window = "sun:09:00-sun:10:00"
  # backup_window      = "08:00-09:00"
  # backup_retention_period = 35

  tags = {
    Name = "sosol-postgres-rds"
  }
}
