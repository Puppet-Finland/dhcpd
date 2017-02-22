# dhcpd

A Puppet module for managing dhcpd

# Module usage

Install dhcpd using Hiera:

    classes:
        - dhcpd

For details, see

* [Class: dhcpd](manifests/init.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* CentOS 7

Any *NIX-style operating system should work out of the box or with small
modifications.

For details see [params.pp](manifests/params.pp).
