output "cluster_id" {
  value = "${aws_elasticache_cluster.memcached.cluster_id}"
}

output "az_mode" {
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
