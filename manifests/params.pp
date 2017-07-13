#
# == Class: dhcpd::params
#
# Defines some variables based on the operating system
#
class dhcpd::params {

    case $::osfamily {
        'RedHat': {
            $package_name = 'dhcp'
            $service_name = 'dhcpd'
            # FIXME: monit integration won't work without this
            $pidfile = undef
        }
        'Debian': {
            $package_name = 'isc-dhcp-server'
            $service_name = 'isc-dhcp-server'
            $pidfile = '/run/dhcpd.pid'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }

    if str2bool($::has_systemd) {
        $service_start = "${::os::params::systemctl} start ${service_name}"
        $service_stop = "${::os::params::systemctl} stop ${service_name}"
    } else {
        $service_start = "${::os::params::service_cmd} ${service_name} start"
        $service_stop = "${::os::params::service_cmd} ${service_name} stop"
    }
}
