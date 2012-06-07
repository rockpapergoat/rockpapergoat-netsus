class { "jamf_files":

  file("/var/appliance/conf":
    ensure => 'directory',
  )
  

}
