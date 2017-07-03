class remoto_pontosecullum {

	file { 'file_remmina_pontosecullum':
			path => '/var/pontosecullum.remmina',
			ensure => file,
			source => 'puppet:///modules/remoto_pontosecullum/pontosecullum.remmina',
			owner => root,
			group => root,
			mode => 0777,
		}

		file { 'pontosecullum.desktop':
			path => '/usr/share/applications/remmina_pontosecullum.desktop',
			ensure => file,
			source => 'puppet:///modules/remoto_pontosecullum/remmina_pontosecullum.desktop',
			owner => root,
			group => root,
			mode => 0644,
		}

		file { 'icon_pontosecullum':
			path => '/var/pontosecullum_icon.png',
			ensure => file,
			source => 'puppet:///modules/remoto_pontosecullum/pontosecullum_icon.png',
			owner => root,
			group => root,
			mode => 0644,
		}

}
