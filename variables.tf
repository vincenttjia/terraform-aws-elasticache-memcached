variable "service_name" {
  description = "service name for memcached"
  type        = "string"
}

variable "maintenance_window" {
  description = "preferred maintenance window for memcached"
  type        = "string"
}

variable "node_type" {
  description = "node type for memcached"
  type        = "string"
}

variable "num_cache_nodes" {
  description = "number of cache nodes for memcached"
  type        = "string"
}

variable "parameter_group_name" {
  description = "parameter group name for memcached"
  type        = "string"
}

variable "security_group_ids" {
  description = "security group ids attached to memcached"
  type        = "list"
}

variable "apply_immediately" {
  description = "specify config changes to applied during maintenance window or immediate"
  type        = "string"
}

variable "engine_version" {
  description = "version of memcached cluster engine"
  type        = "string"
}

variable "subnet_group_name" {
  description = "subnet group which the cluster belongs to"
}

variable "notification_topic_arn" {
  description = "ARN of SNS topic to send notifications of elasticache"
  type        = "string"
  default     = ""
}

variable "memcached_tags" {
  description = "elasticache memcached tags"
  type = "map"
  default = {}
}