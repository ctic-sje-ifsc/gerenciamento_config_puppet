class irpf_lin {

	file { 'IRPF2017-desktop.desktop':
		path => '/usr/share/applications/IRPF2017-desktop.desktop',
		ensure => file,
		source => 'puppet:///modules/irpf_lin/IRPF2017-desktop.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}

	# Comandos para baixar o instalador
	file { 'irpf17.tgz':
		path => '/usr/local/src/irpf17.tgz',
		ensure => file,
		source => 'puppet:///modules/irpf_lin/irpf17.tgz',
		owner => root,
		group => root,
		mode => 777,
	}

	exec { 'descompactar_irpf17.tgz':
		command => '/bin/tar -x -z -C /usr/local/ -f /usr/local/src/irpf17.tgz ; /bin/chown -R root.root /usr/local/IRPF2017 ; /bin/chmod -R 1777 /usr/local/IRPF2017',
		require => [
				File['irpf17.tgz'],
		],
		# so executa senao tiver o arquivo abaixo
		creates => '/usr/local/IRPF2017/irpf.jar',
		timeout => 0,
 }
}
