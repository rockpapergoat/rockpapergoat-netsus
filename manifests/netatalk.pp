# Class: netsus::netatalk
#
#
class netsus::netatalk {
    package { "netatalk":
        ensure => installed,
        enable => false,
    }
    file { "/etc/netatalk/afpd.conf":
        ensure => file,
        source => "netsus/etc/netatalk/afpd.conf"
    }
}