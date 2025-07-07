[![Ansible-Test](https://github.com/mediafellows/ansible-role-flussonic/actions/workflows/ansible.yml/badge.svg)](https://github.com/mediafellows/ansible-role-flussonic/actions/workflows/ansible.yml)

# Flussonic Ansible Role
This is an Ansible role that installs the [Flussonic Streaming server](http://flussonic.com/) and configures it as VOD streaming server with an S3 bucket as source location.

**Currently only supports http video on demand (VOD) / streaming setup and non of all the other Flussonic features**

## Requirements
Flussonic Licence. Optionally AWS account for S3 bucket.

This is only tested on newer versions of Ansbile (> 2.0) and on Ubuntu host but might also work with other Linux flavours/older Ansible versions.

## Role Variables
This is the variables that can be set for this role. Licence key is required, otherwise Flussonic won't start!

```yaml
# You need to set a valid licence key, like this:
flussonic_licence_key: abc123

# Name for VOD endpoint
flussonic_vod_path: vodplayback

# Admin credentials, overwrite:
flussonic_admin_user: admin
flussonic_admin_pw: pleaseChangeMe

# AWS S3 bucket settings, overwrite:
flussonic_source_buckets: [ my-streaming-videos ]
flussonic_bucket_aws_access_key: myAWSkey
flussonic_bucket_aws_secret_key: myAWSkey
# if set to true will create bucket on S3 from Ansible host
# that runs this role (so make sure AWS env works):
s3_create_bucket: false
s3_aws_region: us-east-1

# Set to true to add crossdomain policy to flussonic server doc root
# needed for some flashplayers:
flussonic_crossdomain: false
```

For more variables check the `defaults/main.yml` file.

## Dependencies
This role depends on no other roles.

## Example Playbook
Include the role into your playbook in the usual way:

```yaml
- name: My flussonic play
  hosts: servers
  vars:
    flussonic_licence_key: abc123
    flussonic_source_buckets:
      - my-bucket
    flussonic_bucket_aws_access_key: abs123
    flussonic_bucket_aws_secret_key: abcxyz
    flussonic_admin_pw: supersecret
  roles:
    - { role: mediafellows.flussonic, licence_key: abc123 }
```

## License
BSD, as is.

## Author Information
Stefan Horning <stefan.horning@mediafellows.com>
