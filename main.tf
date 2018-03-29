locals {
  engine              = "memcached"
  port                = "11211"
  cluster_id_format   = "%s-%s-"
  mem_prefix          = "${format(local.cluster_id_format, var.service_name, "mem")}"
  mem_max_name_length = "20"
  mem_max_byte_length = "${(local.mem_max_name_length - length(local.mem_prefix)) / 2}"
  mem_byte_length     = "${min(local.mem_max_name_length, local.mem_max_byte_length)}"

  mem_random_id_byte_length = "8"
}

resource "random_id" "cluster_id" {
  prefix      = "${local.mem_prefix}"
  byte_length = "${local.mem_max_byte_length}"
}

resource "aws_elasticache_cluster" "memcached" {
  cluster_id             = "${random_id.cluster_id.hex}"
  engine                 = "${local.engine}"
  engine_version         = "${var.engine_version}"
  node_type              = "${var.node_type}"
  num_cache_nodes        = "${var.num_cache_nodes}"
  port                   = "${local.port}"
  apply_immediately      = "${var.apply_immediately}"
  az_mode                = "${var.num_cache_nodes == 1 ? "single-az" : "cross-az"}"
  parameter_group_name   = "${var.parameter_group_name}"
  subnet_group_name      = "${var.subnet_group_name}"
  security_group_ids     = ["${var.security_group_ids}"]
  notification_topic_arn = "${var.notification_topic_arn}"

  tags = "${merge(var.memcached_tags, map("ManagedBy", "terraform"))}"
}
