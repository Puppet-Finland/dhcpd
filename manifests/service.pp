#
class dhcpd::service
(
    $ensure,
    $enable
)
{

    service { 'dhcpd':
        ensure  => $ensure,
        enable  => $enable,
        require => Class['dhcpd::install'],
    }
}
