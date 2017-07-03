class remoto_sapafadulto {

	file { 'file_remmina_sapafadulto':
			path => '/var/sapafadulto.remmina',
			ensure => file,
			source => 'puppet:///modules/remoto_sapafadulto/sapafadulto.remmina',
			owner => root,
			group => root,
			mode => 0777,
		}

		file { 'sapafadulto.desktop':
			path => '/usr/share/applications/remmina_sapafadulto.desktop',
			ensure => file,
			source => 'puppet:///modules/remoto_sapafadulto/remmina_sapafadulto.desktop',
			owner => root,
			group => root,
			mode => 0644,
		}

		file { 'icon_sapafadulto':
			path => '/var/sapafadulto_icon.jpeg',
			ensure => file,
			source => 'puppet:///modules/remoto_sapafadulto/sapafadulto_icon.jpeg',
			owner => root,
			group => root,
			mode => 0644,
		}

}
