InfluxDB
========

An Ansible role to install, configure, and manage [InfluxDB](https://github.com/influxdb/influxdb) (a time-series database) v0.9 instances.

Requirements
------------

Prior knowledge/experience with InfluxDB is highly recommended. Full documentation is available [here](https://influxdb.com/docs/v0.9/introduction/overview.html).

Installation
------------

Either clone this repository, or install through Ansible Galaxy directly using the command:

```
ansible-galaxy install rossmcdonald.influxdb
```

Role Variables
--------------

The high-level variables are stored in the `defaults/main.yml` file. The most important ones being:

```
# Channel of InfluxDB to install (stable, unstable, nightly)
influxdb_install_version: stable

# If multiple servers are specified, whether to create a clustered configuration
# NOTE:
#   - Do not attempt to cluster previously-unclustered servers. This can lead to data loss.
#   - This will overwrite your /etc/default/influxdb file (though it makes a backup)
influxdb_cluster_servers: no
# When clustering is enabled, whether or not to overwrite the /etc/hosts file with raw
# IPs (may be useful if no DNS resolution).
influxdb_overwrite_hosts_file: yes
```

More advanced configuration options are stored in the `defaults/main.yml` file, which includes all of the necessary bells and whistles to tweak your configuration. The entire InfluxDB configuration defaults are set using the `defaults/main.yml` file.  You may override these via inventory vars, playbook vars, or extra vars.

Dependencies
------------

No other Ansible dependencies are required. This role was tested and developed with Ansible 1.9.4.

Example Playbook
----------------

An example playbook is included in the `test.yml` file. There is also a `Vagrantfile`, which can be used for quick local testing leveraging [Vagrant](https://www.vagrantup.com/).

Contributions and Feedback
--------------------------

Any contributions are welcome. For any bugs or feature requests, please open an issue through Github.

License
-------

MIT

Author
------

Created by [Ross McDonald](https://github.com/rossmcdonald).

