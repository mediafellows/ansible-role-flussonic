# Flussonic Ansible Role
This is an Ansible role that installs the [Flussonic Streaming server](http://flussonic.com/) with an S3 bucket as source location.

## Requirements
Flussonic Licence. Optionally AWS account for S3 bucket.

This is only tested on newer versions of Ansbile (> 2.0) and on Ubuntu host but might also work with other Linux flavours/older Ansible versions.

## Role Variables
This is the variables that can be set for this role. Licence key is required, otherwise Flussonic won't start!

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
