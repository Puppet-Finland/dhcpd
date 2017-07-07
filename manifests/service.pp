#
class dhcpd::service
(
    $ensure,
    $enable

) inherits dhcpd::params
{

    service { 'dhcpd':
        ensure  => $ensure,
        name    => $::dhcpd::params::service_name,
        enable  => $enable,
        require => Class['dhcpd::install'],
    }
}
