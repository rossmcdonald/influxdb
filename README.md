InfluxDB
========

An Ansible role to install, configure, and manage [InfluxDB](https://github.com/influxdb/influxdb) (a time-series database).

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
install_version: stable

# If multiple servers are specified, whether to create a clustered configuration
# NOTE:
#   - Do not attempt to cluster previously-unclustered servers. This can lead to data loss.
#   - This will overwrite your /etc/default/influxdb file (though it makes a backup)
cluster_servers: no
# When clustering is enabled, whether or not to overwrite the /etc/hosts file with raw
# IPs (may be useful if no DNS resolution).
overwrite_hosts_file: yes

# Whether to load sample data (randomly generated integers) into a test database
# NOTE: sample data cannot be loaded if authentication is enabled
load_sample_data: no
sample_database_name: sample_database
sample_measurement_name: random_ints
sample_num_points: 20
```

More advanced configuration options are stored in the `vars/main.yml` file, which includes all of the necessary bells and whistles to tweak your configuration. The entire InfluxDB configuration file is parameterized using the `vars/main.yml` file, so any changes made there will be persisted to the configuration on each run.

Dependencies
------------

No other dependencies are required.

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

