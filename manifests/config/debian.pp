#
# == Class: dhcpd::config::debian
#
# Debian-specific aspects of dhcpd/dhcpd6 configuration
#
class dhcpd::config::debian
(
    Optional[String] $interfaces_v4 = undef,
    Optional[String] $interfaces_v6 = undef
)
{

    Ini_setting {
        ensure  => present,
        path    => '/etc/default/isc-dhcp-server',
        notify  => Class['::dhcpd::service'],
    }

    if $interfaces_v4 {
        ini_setting { 'interfaces_v4':
            setting => 'INTERFACESv4',
            value   => "\"${interfaces_v4}\"",
        }
    }

    if $interfaces_v6 {
        ini_setting { 'interfaces_v6':
            setting => 'INTERFACESv6',
            value   => "\"${interfaces_v6}\"",
        }
    }
}
