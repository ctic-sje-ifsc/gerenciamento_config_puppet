class x11vnc {
	##x11VNC para area de trabalho remota

		package { 'x11vnc':
			ensure => latest,
		}

		file { 'x11vnc':
			path => '/etc/init.d/x11vnc',
			ensure => absent,
		}

		file { 'x11vnc.service':
			path => '/etc/systemd/system/x11vnc.service',
			ensure => absent,
		}

		file { 'suporte_remoto.png':
			path => '/var/suporte_remoto.png',
			ensure => file,
			source => 'puppet:///modules/x11vnc/suporte_remoto.png',
			owner => root,
			group => root,
			mode => 0644,
		}

		file { 'suporte_remoto.desktop':
			path => '/usr/share/applications/suporte_remoto.desktop',
			ensure => file,
			source => 'puppet:///modules/x11vnc/suporte_remoto.desktop',
			owner => root,
			group => root,
			mode => 0644,
		}


		service { 'x11vnc':
			ensure => stopped,
			enable => false,
		}

}
