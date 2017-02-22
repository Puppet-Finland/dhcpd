# == Class: dhcpd::install
#
# This class installs dhcpd
#
class dhcpd::install
(
    $ensure

) inherits dhcpd::params
{
    package { $::dhcpd::params::package_name:
        ensure   => $ensure,
    }
}
