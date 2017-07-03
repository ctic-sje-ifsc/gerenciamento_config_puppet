class remoto_sophia {

	file { 'file_sophiaslade.remmina':
			path => '/var/sophiaslade.remmina',
			ensure => file,
			source => 'puppet:///modules/remoto_sophia/sophiaslade.remmina',
			owner => root,
			group => root,
			mode => 0777,
		}

		file { 'sophiaslade.desktop':
			path => '/usr/share/applications/sophiaslade.desktop',
			ensure => file,
			source => 'puppet:///modules/remoto_sophia/sophiaslade.desktop',
			owner => root,
			group => root,
			mode => 0644,
		}

}
