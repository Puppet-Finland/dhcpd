#
# == Class: dhcpd::monit
#
# Setup monit rules for dhcpd
#
class dhcpd::monit
(
           $ensure,
    String $monitor_email
)
{
    monit::fragment { 'dhcpd.monit':
        ensure     => $ensure,
        basename   => 'dhcpd',
        modulename => 'dhcpd',
    }
}
