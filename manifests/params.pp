#
# == Class: dhcpd::params
#
# Defines some variables based on the operating system
#
class dhcpd::params {

    case $::osfamily {
        'RedHat': {
            $package_name = 'dhcp'
        }
        'Debian': {
            $package_name = 'isc-dhcp-server'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
