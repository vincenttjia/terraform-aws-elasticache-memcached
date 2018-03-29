# terraform-aws-elasticache-memcached
terraform module to create elasticache memcached

Requirements
------------
- elasticache subnet group
- elasticache parameter group
- security group ids to attach
- SNS topic ARN if use notification

Usage
-----

```hcl
module "test_memcached" {
  source  = "github.com/traveloka/terraform-aws-elasticache-memcached"
  version = "MODULE_VERSION"

  service_name    = "memtest"
  engine_version  = "1.4.34"
  node_type       = "cache.t2.micro"
  num_cache_nodes = "1" # 1 will set single-az, 2 will set cross_az

  parameter_group_name = "default.memcached1.4"
  subnet_group_name    = "test"
  maintenance_window   = "sun:15:00-sun:16:00"

  security_group_ids = ["GROUP_IDS"]

  apply_immediately = "true"

  memcached_tags = {
    Name          = "memtest-mem"
    Service       = "memtest"
    ProductDomain = "test"
    Environment   = "production"
  }
}
```

Contributing
-------
- submit pull request and ask for review
- ensure you add tests in every changes
- issues submission is welcome, but don't guarantee immediate fix.
- there is no standard for contributing yet, so just submit as your preferred format

How to Use Examples
-------
1. Ensure you have ruby in your env with bundler gem
   ```bash
   gem install bundler
   ```
2. Set your parameter in *examples/test_memcached/\*.tf*
3. Go to module root and execute full cycle test
   ```bash
   bundle exec kitchen test
   ```
4. If you want staged cycle
   ```bash
   bundle exec kitchen create
   bundle exec kitchen converge
   bundle exec kitchen verify
   bundle exec kitchen destroy
    ```

Authors
-------

- [Rizki](https://github.com/rizkidoank)

License
-------

Apache 2 Licensed. See LICENSE for full details.