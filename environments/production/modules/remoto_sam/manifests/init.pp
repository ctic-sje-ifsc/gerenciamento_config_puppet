class remoto_sam {

	file { 'file_remmina_samdesktop':
			path => '/var/sam.remmina',
			ensure => file,
			source => 'puppet:///modules/remoto_sam/sam.remmina',
			owner => root,
			group => root,
			mode => 0777,
		}

		file { 'sam.desktop':
			path => '/usr/share/applications/remmina_sam.desktop',
			ensure => file,
			source => 'puppet:///modules/remoto_sam/remmina_sam.desktop',
			owner => root,
			group => root,
			mode => 0644,
		}

		file { 'icon_sam':
			path => '/var/sam.png',
			ensure => file,
			source => 'puppet:///modules/remoto_sam/sam.png',
			owner => root,
			group => root,
			mode => 0644,
		}

}
