# == Class: dhcpd
#
# This class sets up dhcpd
#
# Currently functionality is limited to package and service management.
#
# == Parameters
#
# [*manage*]
#   Whether to manage dhcpd using Puppet. Valid values are true (default) 
#   and false.
# [*ensure*]
#   Status of dhcpd. Valid values are 'present' (default) and 'absent'.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class dhcpd
(
    Boolean                  $manage = true,
    Enum['present','absent'] $ensure = 'present'

) inherits dhcpd::params
{

if $manage {
    class { '::dhcpd::install':
        ensure => $ensure,
    }

    if $ensure == 'present' {
        $service_ensure = 'running'
        $service_enable = true
    } elsif $ensure == 'absent' {
        $service_ensure = 'stopped'
        $service_enable = false
    }

    class { '::dhcpd::service':
        ensure => $service_ensure,
        enable => $service_enable,
    }
}
}
