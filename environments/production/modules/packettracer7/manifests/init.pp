class packettracer7{

	file { 'dir_packettracer7':
	  	path => '/opt/pt',
	  	ensure => file,
	  	source => 'puppet:///modules/packettracer7/pt',
	  	owner => root,
	  	group => root,
	  	mode => 1775,
	  	recurse => true,
	}

	file { 'packettracer7.desktop':
		path => '/usr/share/applications/packettracer7.desktop',
	  	ensure => file,
	  	source => 'puppet:///modules/packettracer7/packettracer7.desktop',
	  	owner => root,
	  	group => root,
	  	mode => 644,
	  	require => File['dir_packettracer7']	,
	}

	file { 'link_packettracer7':
		path => '/usr/local/bin/packettracer7',
		ensure => link,
		target => '/opt/pt/packettracer',
		require => File['dir_packettracer7'],
	}

}
