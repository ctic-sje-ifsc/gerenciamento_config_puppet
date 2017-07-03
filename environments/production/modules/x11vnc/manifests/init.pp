class x11vnc {
	##x11VNC para area de trabalho remota

		$initd_x11vnc = $lsbdistcodename ? {
			trusty	=> 'puppet:///modules/x11vnc/ubuntu_x11vnc',
			jessie => 'puppet:///modules/x11vnc/x11vnc',
		}
		package { 'x11vnc':
			ensure => latest,
		}

		file { 'x11vnc':
			path => '/etc/init.d/x11vnc',
			ensure => file,
			source => $initd_x11vnc,
			owner => root,
			group => root,
			mode => 0755,
		}

		if $lsbdistcodename == jessie {
			file { 'x11vnc.service':
				path => '/etc/systemd/system/x11vnc.service',
				ensure => file,
				source => 'puppet:///modules/x11vnc/x11vnc.service',
				owner => root,
				group => root,
				mode => 0755,
			}
		}
		if $lsbdistcodename == jessie {
			exec { 'systemctl_daemon-reload_x11vnc':
				command => "/bin/systemctl daemon-reload",
				subscribe => File["x11vnc.service"],
				refreshonly => true,
			}
		}
		service { 'x11vnc':
			ensure => running,
			enable => true,
			require => [
	#			File['x11vnc'],
				Package['x11vnc'],
			],
		}
	## fim do x11vnc


}
