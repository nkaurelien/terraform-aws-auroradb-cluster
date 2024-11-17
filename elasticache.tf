resource "aws_elasticache_serverless_cache" "redis" {
  engine = "redis"
  name   = "cache-for-${aws_rds_cluster.aurorards.cluster_identifier}"

  cache_usage_limits {
    data_storage {
      maximum = 10
      unit    = "GB"
    }
    ecpu_per_second {
      maximum = 5000
    }
  }
  # daily_snapshot_time      = "09:00"
  # description              = "Test Server"
  # kms_key_id               = aws_kms_key.test.arn
  major_engine_version     = "7"
  snapshot_retention_limit = 1
  security_group_ids       = [aws_security_group.allow_cache.id]
  subnet_ids               = aws_db_subnet_group.mydb_subnet_group.subnet_ids
  
}