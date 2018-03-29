locals {
  service_name = "memtest"
}

data "aws_vpc" "develop" {
  filter {
    name   = "tag:Name"
    values = ["development-vpc"]
  }
}

data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.develop.id}"
  name   = "default"
}

module "test_memcached" {
  source = "../../"

  service_name    = "${local.service_name}"
  engine_version  = "1.4.34"
  node_type       = "cache.t2.micro"
  num_cache_nodes = "1"

  parameter_group_name = "default.memcached1.4"
  subnet_group_name    = "test"
  maintenance_window   = "sun:15:00-sun:16:00"

  security_group_ids = ["${data.aws_security_group.default.id}"]

  apply_immediately = "true"

  memcached_tags = {
    Name          = "memtest-mem"
    Service       = "memtest"
    ProductDomain = "test"
    Environment   = "production"
  }
}
