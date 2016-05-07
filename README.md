# Flussonic Ansible Role
This is an Ansible role that installs the [Flussonic Streaming server](http://flussonic.com/) with an S3 bucket as source location.

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
flussonic_bucket_name: my-streaming-videos
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

## Dependencies
This role depends on no other roles.

## Example Playbook
Include the role into your playbook in the usual way:

```yaml
- name: My play
  hosts: servers
  roles:
    - { role: mediapeers.flussonic, licence_key: abc123 }
```

## License
BSD, as is.

## Author Information
Stefan Horning <horning@mediapeers.com>
