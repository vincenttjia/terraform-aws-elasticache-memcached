require 'awspec'
require 'aws-sdk'
require 'rhcl'

config = Rhcl.parse(File.open('examples/test_memcached/main.tf'))

cluster_id = config['module']['memcached']['cluster_id']
engine_version = config['module']['memcached']['engine_version']
maintenance_window = config['module']['memcached']['maintenance_window']
node_type = config['module']['memcached']['node_type']
num_cache_nodes = config['module']['memcached']['num_cache_nodes']
parameter_group_name = config['module']['memcached']['parameter_group_name']
subnet_group_name = config['module']['memcached']['subnet_group_name']
security_group_ids = config['module']['memcached']['security_group_ids']
availability_zones = config['module']['memcached']['availability_zones']
notification_topic_arn = config['module']['memcached']['notification_topic_arn']
vpc_id = config['module']['memcached']['vpc_id']
apply_immediately = config['module']['memcached']['apply_immediately']
az_mode = config['module']['memcached']['az_mode']

state = 'terraform.tfstate.d/kitchen-terraform-default-aws/terraform.tfstate'
tf_state = JSON.parse(File.open(state).read)

describe elasticache(cluster_id.to_s) do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc(vpc_id) }
  security_group_ids.each do |group_id|
    it { should have_security_group(group_id) }
  end
  it { should has_cache_parameter_group(parameter_group_name.to_s) }
  its(:cache_cluster_id) { should eq cluster_id.to_s }
  its(:cache_node_type) { should eq node_type.to_s }
  its(:engine) { should eq 'memcached' }
  its(:engine_version) { should eq engine_version.to_s }
  its(:num_cache_nodes) { should eq num_cache_nodes }
  its(:preferred_availability_zone) { should eq availability_zones.to_s }
  its(:preferred_maintenance_window) { should eq maintenance_window.to_s }
  its(:notification_configuration) { should eq notification_topic_arn.to_s }
  its(:cache_security_groups) { should eq [cluster_id.to_s] }
  its(:cache_subnet_group_name) { should subnet_group_name.to_s }
end
