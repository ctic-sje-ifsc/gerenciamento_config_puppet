class remoto_sapafjovem {

	file { 'file_remmina_sapafjovem':
			path => '/var/sapafjovem.remmina',
			ensure => file,
			source => 'puppet:///modules/remoto_sapafjovem/sapafjovem.remmina',
			owner => root,
			group => root,
			mode => 0777,
		}

		file { 'sapafjovem.desktop':
			path => '/usr/share/applications/remmina_sapafjovem.desktop',
			ensure => file,
			source => 'puppet:///modules/remoto_sapafjovem/remmina_sapafjovem.desktop',
			owner => root,
			group => root,
			mode => 0644,
		}

		file { 'icon_sapafjovem':
			path => '/var/sapafjovem_icon.jpeg',
			ensure => file,
			source => 'puppet:///modules/remoto_sapafjovem/sapafjovem_icon.jpeg',
			owner => root,
			group => root,
			mode => 0644,
		}

}
