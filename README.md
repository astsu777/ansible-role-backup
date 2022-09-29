Ansible Role: Backup
=========

This role setup some local backup mechanics that will save the following:

- Create a TAR compressed archive of the whole filesystem
- Dump each MySQL/MariaDB databases in separate files and also a single file with all databases in it

Requirements
------------

No specific requirements for this role.

Role Variables
--------------

There are two variables present in this role. The backup user is actually a system user and therefore it is required to setup some credentials.

Finally, it is also secure to add to the list of known hosts the SSH fingerprint of the remote server which will store the backup files.

```
backup_user: backupuser
backup_password: MyPassword
backup_server: backupserver.server.com
backup_private_key: |
  -----BEGIN RSA PRIVATE KEY-----
  MIIEiqwdDL_QdwPDäSAKDöALSDaèdGC07BGdTN/awuKoIHfK8LcX+GIpI+qTU
  vCeads¨éKDASKDASDOSAKasodkasoQaczVwfhijXvXpGcYOIjXW1bOy1vFfOs9
  S1BwRf/tPAIwLG6wmhXbhL9gprfPP0VbHO9+oGRBS7KQmpOOwrUOo11gmgFj84hl
  XwEMadsipadélakdaposdiaaéldksvM2u6RTj+oFK/u7K0MF+QVbfl8q1Ho+Cq
  xL3nrIcc6F1NBFmJ6NxoX8emqUe9m9RXpLBAvn6uVap3bSH6Ju1uEC/xVXtoyLKl
  jLfdkfdospifélfkdsopfsifsélkfwQweVQwIDAQABAoIBAQCFgJ+1VWxLWTDE
  Xtpuf98lZTL1brlX0+nfZXevGyJ+FoTbJlZF4Fsw1jvPDpgDXxm8SWvZ7mxzM+8m
  +pWy/TaO/lQmGjd0ip308IDWX63SuDDQhZRPte5ETAGphnHooKF6TNoMpEtczgYR
  v+vFdjpWqd1nt8ynElUAw/H/ipPIXEFM51izEyhHm4BAshtPCmlgaILvvup65yIa
  +z/QM98QEXaL2l5JVScz+LUeJzpuqUSOULsc2ziZLQ2bc61IYXEpHNgJLStkBjT/
  clzMfl0PNs77i6cnvkrk3GmDDeIWAVvxfeouNE7gwDlDDfN61lEbdDWn3J94doLd
  0wQZn+OZAoGBAPVwv5/5r/ggLpN2bYiF4+QXPIp06DDI7n6OIK07Fq/xpWNqxhAv
  5c/MrqS+SryEYbcktiM2yZ7FhIITIBNa1yCDagOA2AAJgtJOupqcMtb5kSKZoqZD
  Z3sww2n6QUoQjoh4wONMLONYj042uixIzbJtu7eMnr1EnYAU8droyrm9AoGBANkE
  SwwcEALfrMLJtV1/SVFxPHIvqGBvAlz35AzVh6cvr38+61UmRUtXGIwLKpsfPYAM
  HRDDlaspèdaè¨pd¨pasaKDöSLDgvhMo3+KiTue1K8FxnOSMETaD5mbl4NAc
  rlQILJUF0stGqhWhTrMZ/Es7CztBIzIRJRennBlpuytbmxFlZd4qkAKqozusmKF+
  alQdChAeOHKsbnqocEgbDxEulIxo9wbrPVxLEmszgcfUCEmvvgpogCZHxbVuBQHS
  w9n/IlcCgYEA8g47jwFfvqDgabwfSgextMzTG+i2E6Y8W5cAYXjpijqdPh/myYt0
  pcd8gnDMaPZolLGiaxf4Ds+IgMKvfixpkqyC50CaxY9nZpiWhfD06ObOHKHcX9ux
  5AG7BiUouA65sUM4egcEK4XD3zTsvywtyoSwFYG4NKI1KrUBBoYX/Xo=
  -----END RSA PRIVATE KEY-----

backupserver_ssh_fingerprint: |
  |1|nJtOW+1UWkFsWqVHWt0orBqQwBs=|AiOk1VYbklEEH/MKt+Mdl/KXLBs= ecdsa-sha2-nistp256 AAAAE2BGt4ViQpDPz+i2KCxw=

mysql_user: root
mysql_root_password: MyPassword
```

The above variables should be definied within host_vars or group_vars encrypted with *ansible-vault*.

Dependencies
------------

No dependencies from other roles required.

Example Playbook
----------------

Here is a simple example playbook to use this role:

```
hosts: all
user: root
roles:
  - { role: backup, tags: [ 'backup' ] }
```

License
-------

MIT / BSD

Author Information
------------------

My name is Gaétan. You can follow me on [Twitter](https://twitter.com/astsu777)

Website: [ICT Pour Tous](https://www.ictpourtous.com)
