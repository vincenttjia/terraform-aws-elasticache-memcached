locals {
  engine = "memcached"
  port   = "11211"
}

resource "aws_elasticache_cluster" "memcached" {
  cluster_id             = "${var.cluster_id}"
  engine                 = "${local.engine}"
  node_type              = "${var.node_type}"
  num_cache_nodes        = "${var.num_cache_nodes}"
  port                   = "${local.port}"
  apply_immediately      = "${var.apply_immediately}"
  availability_zones     = "${var.availability_zones}"
  az_mode                = "${var.az_mode}"
  engine_version         = "${var.engine_version}"
  parameter_group_name   = "${var.parameter_group_name}"
  maintenance_window     = "${var.maintenance_window}"
  notification_topic_arn = "${var.notification_topic_arn}"
  security_group_ids     = "${var.security_group_ids}"
  subnet_group_name      = "${var.subnet_group_name}"

  tags = {
    Managedby = "terraform"
  }
}
