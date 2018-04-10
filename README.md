# terraform-aws-elasticache-memcached
terraform module to create elasticache memcached

Requirements
------------
- elasticache subnet group
- elasticache parameter group
- security group ids to attach
- SNS topic ARN if use notification

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