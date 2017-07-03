class remoto_ibsispes {

	file { 'file_remmina_ibsispes':
			path => '/var/ibsispes.remmina',
			ensure => file,
			source => 'puppet:///modules/remoto_ibsispes/ibsispes.remmina',
			owner => root,
			group => root,
			mode => 0777,
		}

		file { 'ibsispes.desktop':
			path => '/usr/share/applications/remmina_ibsispes.desktop',
			ensure => file,
			source => 'puppet:///modules/remoto_ibsispes/remmina_ibsispes.desktop',
			owner => root,
			group => root,
			mode => 0644,
		}

		file { 'icon_ibsispes':
			path => '/var/ibsispes_icon.jpeg',
			ensure => file,
			source => 'puppet:///modules/remoto_ibsispes/ibsispes_icon.jpeg',
			owner => root,
			group => root,
			mode => 0644,
		}

}
