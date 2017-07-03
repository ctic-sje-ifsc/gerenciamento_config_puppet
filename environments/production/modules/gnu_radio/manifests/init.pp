class gnu_radio {
	$packageskile = ['gnuradio', 'gqrx-sdr', 'rtl-sdr', 'gr-osmosdr', 'python-qwt5-qt4']

	package { $packageskile:
		ensure => installed,
	}
	file { 'blacklist.conf':
		path => '/etc/modprobe.d/blacklist.conf',
		ensure => file,
		source => 'puppet:///modules/gnu_radio/blacklist.conf',
		owner => root,
		group => root,
		mode => 644,
	}
	exec { 'remove_module':
		command => '/sbin/rmmod dvb_usb_rtl28xxu; /bin/touch /var/gatilho_gnu_radio',
		require => [
				File['/etc/modprobe.d/blacklist.conf'],
		],
		# so executa senao tiver o arquivo abaixo
		creates => '/var/gatilho_gnu_radio',
		timeout => 0,
 }
}
