
resource "aws_security_group" "allow_aurora" {
  name        = "Aurora_sg"
  description = "Security group for RDS Aurora"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "MYSQL/Aurora"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "allow_cache" {
  name        = "Elasticache_redis_sg"
  description = "Security group for Redis for RDS Aurora"
  vpc_id      = aws_vpc.main.id



  ingress {
    description = "Elasticache/memcached"
    from_port   = 11211
    to_port     = 11213
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "Elasticache/valkey-or-redis"
    from_port   = 6379
    to_port     = 6380
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  #   egress {
  #     description = "from the NAT instance to the cache port (11211)."
  #     from_port        = 11211
  #     to_port          = 11211
  #     protocol         = "tcp"
  #     cidr_blocks      = ["0.0.0.0/0"]
  #     ipv6_cidr_blocks = ["::/0"]
  #   }


  #   egress {
  #     description = "from the NAT instance to the cache port (6379)."
  #     from_port        = 6379
  #     to_port          = 6379
  #     protocol         = "tcp"
  #     cidr_blocks      = ["0.0.0.0/0"]
  #     ipv6_cidr_blocks = ["::/0"]
  #   }
}