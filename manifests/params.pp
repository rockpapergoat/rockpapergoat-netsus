# cf. https://github.com/saz/puppet-ssh
class netsus::params {
   case $operatingsystem {
      /(Ubuntu|Debian)/: {
         $ssh_server_pkg = 'openssh-server'
         $ssh_client_pkg = 'openssh-client'
         $sshd_config = 'etc/ssh/sshd_config'
         $ssh_config = '/etc/ssh/ssh_config'
         $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
         $ssh_service_name = 'ssh' 
          
      }
      /(RedHat|Fedora|CentOS)/: {
         $ssh_server_pkg = 'openssh-server'
         $ssh_client_pkg = 'openssh-client'
         $sshd_config = 'etc/ssh/sshd_config'
         $ssh_config = '/etc/ssh/ssh_config'
         $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
         $ssh_service_name = 'sshd' 
          
      }
       
   }
    

}
