

resource "aws_db_subnet_group" "mydb_subnet_group" {
  name = "mydb-subnet-group"
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
  cluster_identifier     = "myauroracluster"
  engine                 = "aurora-mysql" # Aurora MySQL 2.x
  engine_version         = "5.7.mysql_aurora.2.12.0"
  database_name          = var.database_name
  master_username        = var.database_username
  master_password        = var.database_password
  vpc_security_group_ids = [aws_security_group.allow_aurora.id]
  db_subnet_group_name   = aws_db_subnet_group.mydb_subnet_group.name
  storage_encrypted      = false
  skip_final_snapshot    = true
  backup_retention_period = 3 # days

}

resource "aws_rds_cluster_instance" "cluster_instances" {
  identifier          = "myaurorainstance"
  cluster_identifier  = aws_rds_cluster.aurorards.id
  instance_class      = "db.t3.small"
  engine              = aws_rds_cluster.aurorards.engine
  engine_version      = aws_rds_cluster.aurorards.engine_version
  publicly_accessible = true
}