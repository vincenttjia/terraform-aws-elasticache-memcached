output "cluster_id" {
  description = "The cluster identifier of this memcached"
  value = "${aws_elasticache_cluster.memcached.cluster_id}"
}

output "az_mode" {
  description = "The provisioning mode of this memcached"
  value = "${aws_elasticache_cluster.memcached.az_mode}"
}

output "security_group_ids" {
  value = "${aws_elasticache_cluster.memcached.security_group_ids}"
}

output "configuration_endpoint" {
  value = "${aws_elasticache_cluster.memcached.configuration_endpoint}"
}

output "endpoint" {
  value = "${aws_elasticache_cluster.memcached.cluster_address}"
}

output "parameter_group_name" {
  value = "${aws_elasticache_cluster.memcached.parameter_group_name}"
}

output "port" {
  value = "${aws_elasticache_cluster.memcached.port}"
}

output "subnet_group_name" {
  value = "${aws_elasticache_cluster.memcached.subnet_group_name}"
}