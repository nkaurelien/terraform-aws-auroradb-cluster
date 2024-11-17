locals {
  db_cluster_name = "myauroracluster"
}

resource "aws_rds_cluster_parameter_group" "my_parameter_group" {
  name        = "${local.db_cluster_name}-parameter-group"
  family      = "aurora-mysql5.7"
  description = "Custom parameter group for Aurora MySQL"

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "collation_server"
    value = "utf8mb4_unicode_ci"
  }
}


resource "aws_db_subnet_group" "mydb_subnet_group" {
  name = "${local.db_cluster_name}-subnet-group"
  subnet_ids = [
    # data.aws_subnet.subnet1.id,
    # data.aws_subnet.subnet2.id
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id
  ]

  tags = {
    Name = "MyDBSubnetGroup"
  }
}

resource "aws_rds_cluster" "aurorards" {
  cluster_identifier      = local.db_cluster_name
  engine                  = "aurora-mysql" # Aurora MySQL 2.x
  engine_version          = "5.7.mysql_aurora.2.12.0"
  database_name           = var.database_name
  master_username         = var.database_username
  master_password         = var.database_password
  vpc_security_group_ids  = [aws_security_group.allow_aurora.id]
  db_subnet_group_name    = aws_db_subnet_group.mydb_subnet_group.name
  storage_encrypted       = false
  skip_final_snapshot     = true
  backup_retention_period = 3 # days
  #   preferred_maintenance_window = "sun:05:00-sun:09:00"
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.my_parameter_group.name



}

resource "aws_rds_cluster_instance" "cluster_instances" {
  identifier         = "${local.db_cluster_name}-instance"
  cluster_identifier = aws_rds_cluster.aurorards.id
  instance_class     = "db.t3.small"
  #   instance_class      = "db.r5.large" # memory  optimized 2vCpu 16GiB Ram 
  engine              = aws_rds_cluster.aurorards.engine
  engine_version      = aws_rds_cluster.aurorards.engine_version
  publicly_accessible = true


}