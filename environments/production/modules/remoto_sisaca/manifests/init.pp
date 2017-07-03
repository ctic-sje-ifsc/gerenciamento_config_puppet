class remoto_sisaca {

	file { 'file_remmina_sisaca':
			path => '/var/sisaca.remmina',
			ensure => file,
			source => 'puppet:///modules/remoto_sisaca/sisaca.remmina',
			owner => root,
			group => root,
			mode => 0777,
		}

		file { 'sisaca.desktop':
			path => '/usr/share/applications/remmina_sisaca.desktop',
			ensure => file,
			source => 'puppet:///modules/remoto_sisaca/remmina_sisaca.desktop',
			owner => root,
			group => root,
			mode => 0644,
		}

		file { 'icon_sisaca':
			path => '/var/sisaca_icon.jpeg',
			ensure => file,
			source => 'puppet:///modules/remoto_sisaca/sisaca_icon.jpeg',
			owner => root,
			group => root,
			mode => 0644,
		}

}
