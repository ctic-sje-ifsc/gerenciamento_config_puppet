class remoto_asctime {

	file { 'file_remmina_asc':
			path => '/var/asc.remmina',
			ensure => file,
			source => 'puppet:///modules/remoto_asctime/asc.remmina',
			owner => root,
			group => root,
			mode => 0777,
		}

		file { 'remmina_asc.desktop':
			path => '/usr/share/applications/remmina_asctime.desktop',
			ensure => file,
			source => 'puppet:///modules/remoto_asctime/remmina_asctime.desktop',
			owner => root,
			group => root,
			mode => 0644,
		}

		file { 'icon_remmina_asc':
			path => '/var/asctime_icon.jpeg',
			ensure => file,
			source => 'puppet:///modules/remoto_asctime/asctime_icon.jpeg',
			owner => root,
			group => root,
			mode => 0644,
		}

}
