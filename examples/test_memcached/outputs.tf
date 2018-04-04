output "mem_cluster_id" {
  description = "The cluster identifier for this memcached"
  value       = "${module.test_memcached.cluster_id}"
}

output "mem_az_mode" {
  description = "The provisioning mode for this memcached"
  value       = "${module.test_memcached.az_mode}"
}

output "mem_security_groups" {
  description = "Security groups attached to this memcached"
  value       = "${module.test_memcached.security_group_ids}"
}
