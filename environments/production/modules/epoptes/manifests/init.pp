class epoptes {

	package { 'epoptes':
		ensure => latest,
	}

	package { 'epoptes-client':
		ensure => absent,
	}

	exec { 'delgroup epoptes':
		command => "/usr/sbin/delgroup epoptes",
		require => Package ['epoptes'],
		schedule => daily,
	}

	service { 'epoptes':
		ensure => running,
		enable => true,
		require => Package['epoptes'],
	}

	exec { 'update-rc_epoptes':
		command => "/usr/sbin/update-rc.d epoptes defaults ; /usr/bin/touch /var/gatilho_update_rc_epoptes",
		creates => '/var/gatilho_update_rc_epoptes',
	}

}
