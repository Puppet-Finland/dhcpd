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
# [*manage_monit*]
#   Whether to monitor dhcpd with monit. Valid values are true (default) and
#   false.
# [*ensure*]
#   Status of dhcpd. Valid values are 'present' (default) and 'absent'.
# [*interfaces_v4*]
#   A space-separated string of interfaces on which dhcpd should listen. Defaults 
#   to undef.
# [*interfaces_v6*]
#   A space-separate string of interfaces on which dhcpd6 should listen. Defaults 
#   to undef.
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
    Boolean                  $manage_monit = true,
    Enum['present','absent'] $ensure = 'present',
                             $interfaces_v4 = undef,
                             $interfaces_v6 = undef,
    String                   $monitor_email = $::servermonitor


) inherits dhcpd::params
{

if $manage {
    class { '::dhcpd::install':
        ensure => $ensure,
    }

    if $::osfamily == 'Debian' {
        class { '::dhcpd::config::debian':
            interfaces_v4 => $interfaces_v4,
            interfaces_v6 => $interfaces_v6,
        }
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

    if $manage_monit {
        class { '::dhcpd::monit':
            ensure        => $ensure,
            monitor_email => $monitor_email,
        }
    }

}
}
