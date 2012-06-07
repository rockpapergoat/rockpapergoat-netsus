# 110506
# reposado clone manifest

# pythonversion comes from a custom fact which should be instaled via factsync
case $pythonversion {
	/2.6/: {
		# will this test actually succeed?
		include reposado_install
	}
	default: {
		# what's a good default behavior here?
		notice("check again")
	}
}

# Class: reposado_install
#
#
class reposado_install {
	# we need somewhere to put this stuff
	file { "/usr/local/reposado":
		ensure => directory,
	}
	
	# and we need the latest pull from git
	vcsrepo { "/usr/local/reposado":
		ensure => present,
		provider => git,
		source => "https://github.com/wdas/reposado.git",
		require => File["/usr/local/reposado"],
	}

	# safety to ensure the commands are executable; they might be by default
	exec { "make_reposado_executable":
		command => "/bin/chmod +x /usr/local/reposado/code/repoutil /usr/local/reposado/code/repo_sync",
		require => Vcsrepo["/usr/local/reposado"],
		#require => File["/usr/local/reposado/code/repo_sync","/usr/local/reposado/code/repoutil"],
		refreshonly => true,
	}
	
	# add cron job to check at 2 am
	# not sure if the cron type will take a 'require'
	cron { "reposync":
		command => "/usr/local/reposado/code/repo_sync",
		user => root,
		hour => 2,
		ensure => present,
		require => File["/usr/local/reposado/code/preferences.plist"],
	}
}