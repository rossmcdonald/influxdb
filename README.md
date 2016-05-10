InfluxDB
========

An Ansible role to install, configure, and manage
[InfluxDB](https://github.com/influxdata/influxdb) (a time-series
database).

Requirements
------------

Prior knowledge/experience with InfluxDB is highly recommended. Full
documentation is available
[here](https://docs.influxdata.com/influxdb/latest).

Installation
------------

Either clone this repository, or install through Ansible Galaxy directly using the command:

```
ansible-galaxy install rossmcdonald.influxdb
```

Role Variables
--------------

The high-level variables are stored in the `defaults/main.yml` file. The most important one being:

```
# Channel of InfluxDB to install (stable, unstable, nightly)
influxdb_install_version: stable
```

More advanced configuration options are also stored in the
`defaults/main.yml` file, which includes all of the necessary bells
and whistles to tweak your configuration. There are more advanced
runtime options available in the `vars/main.yml` file as well.

Dependencies
------------

No other Ansible dependencies are required. This role was tested and
developed with Ansible 1.9.4.

Testing
-------

To test the role locally, it is recommended to either use
[Vagrant](https://www.vagrantup.com/) or Docker. There are a variety
of available Dockerfiles in the `/docker` directory. For more
information on building the images, please review the
`docker/build.sh` script.

To run a playbook within one of the Docker images, simply run:

```
docker run -v $(pwd):/root <DOCKER IMAGE> <PLAYBOOK>
```

For example, to run the included `test.yml` using the included CentOS
7 Docker image, run (after building the image):

```
docker run -v $(pwd):/root ansible.influxdb.centos7 test.yml
```

Example Playbook
----------------

An example playbook is included in the `test.yml` file. There is also
a `Vagrantfile`, which can be used for quick local testing leveraging
[Vagrant](https://www.vagrantup.com/), and a few Docker Dockerfiles
located in the `/docker` directory.

Contributions and Feedback
--------------------------

Any contributions are welcome. For any bugs or feature requests,
please open an issue through Github.

License
-------

MIT

Author
------

Created by [Ross McDonald](https://github.com/rossmcdonald).

