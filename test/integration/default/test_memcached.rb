require 'awspec'
require 'aws-sdk'
require 'rhcl'

# parse terraform config
config = Rhcl.parse(File.open('examples/test_memcached/main.tf'))

# assign attributes to be tested to variables
engine_version = config['module']['test_memcached']['engine_version']
maintenance_window = config['module']['test_memcached']['maintenance_window']
node_type = config['module']['test_memcached']['node_type']
num_cache_nodes = config['module']['test_memcached']['num_cache_nodes']
parameter_group_name = config['module']['test_memcached']['parameter_group_name']
subnet_group_name = config['module']['test_memcached']['subnet_group_name']
notification_topic_arn = config['module']['test_memcached']['notification_topic_arn']

# parse state file
state_file = 'terraform.tfstate.d/kitchen-terraform-default-aws/terraform.tfstate'
state = JSON.parse(File.open(state_file).read)
outputs = state['modules'][0]['outputs']

# get values from state output
# for attributes that cannot parsed from config
cluster_id = outputs['mem_cluster_id']['value']

describe elasticache(cluster_id.to_s) do
  it { should exist }
  it { should be_available }
  it { should have_security_group('default') }
  it { should have_cache_parameter_group(parameter_group_name.to_s) }
  its(:cache_cluster_id) { should eq cluster_id.to_s }
  its(:cache_node_type) { should eq node_type.to_s }
  its(:engine) { should eq 'memcached' }
  its(:engine_version) { should eq engine_version.to_s }
  its(:num_cache_nodes) { should eq num_cache_nodes.to_i }
  its(:preferred_maintenance_window) { should eq maintenance_window.to_s }
  its(:notification_configuration) { should eq notification_topic_arn }
  its(:cache_subnet_group_name) { should eq subnet_group_name.to_s }
end
