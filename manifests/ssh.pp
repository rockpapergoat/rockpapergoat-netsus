# ssh service setup

# Class: netsus::ssh
#
#
class netsus::ssh {
 

    package { $ssh:
        ensure => installed,
        enable => true,
    }

    file { $sshd_conf:
        ensure => file,
        #template()
    }
}