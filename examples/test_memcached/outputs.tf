output "mem_cluster_id" {
  value = "${module.test_memcached.cluster_id}"
}

output "mem_az_mode" {
  value = "${module.test_memcached.az_mode}"
}

output "mem_security_groups" {
  value = "${module.test_memcached.security_group_ids}"
}