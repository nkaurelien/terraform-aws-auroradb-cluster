output "security_group_id" {
  description = "The ID of the security group for the Aurora cluster"
  value       = aws_security_group.allow_aurora.id
}

output "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  value       = aws_db_subnet_group.mydb_subnet_group.name
}

output "rds_cluster_endpoint" {
  description = "The endpoint of the RDS Aurora cluster"
  value       = aws_rds_cluster.aurorards.endpoint
}

output "rds_cluster_reader_endpoint" {
  description = "The reader endpoint of the RDS Aurora cluster"
  value       = aws_rds_cluster.aurorards.reader_endpoint
}

output "rds_cluster_instance_endpoint" {
  description = "The endpoint of the RDS Aurora cluster instance"
  value       = aws_rds_cluster_instance.cluster_instances.endpoint
}

output "cache_id" {
  description = "The ID of the ElastiCache serverless cache"
  value       = aws_elasticache_serverless_cache.redis.id
}

output "cache_arn" {
  description = "The ARN of the ElastiCache serverless cache"
  value       = aws_elasticache_serverless_cache.redis.arn
}

output "cache_endpoint" {
  description = "The endpoint of the ElastiCache serverless cache"
  value       = aws_elasticache_serverless_cache.redis.endpoint
}

output "cache_reader_endpoint" {
  description = "The reader endpoint of the ElastiCache serverless cache"
  value       = aws_elasticache_serverless_cache.redis.reader_endpoint
}