class remoto_isaacdesktop {

	file { 'file_remmina_isaacdesktop':
			path => '/var/isaacdesktop.remmina',
			ensure => file,
			source => 'puppet:///modules/remoto_isaacdesktop/isaacdesktop.remmina',
			owner => root,
			group => root,
			mode => 0777,
		}

		file { 'isaacdesktop.desktop':
			path => '/usr/share/applications/remmina_isaacdesktop.desktop',
			ensure => file,
			source => 'puppet:///modules/remoto_isaacdesktop/remmina_isaacdesktop.desktop',
			owner => root,
			group => root,
			mode => 0644,
		}

		file { 'icon_isaacdesktop':
			path => '/var/isaac.ico',
			ensure => file,
			source => 'puppet:///modules/remoto_isaacdesktop/isaac.ico',
			owner => root,
			group => root,
			mode => 0644,
		}

}
