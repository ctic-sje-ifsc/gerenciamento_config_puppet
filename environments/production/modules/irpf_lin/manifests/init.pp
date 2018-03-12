class irpf_lin {

	file { 'IRPF2018-desktop.desktop':
		path => '/usr/share/applications/IRPF2018-desktop.desktop',
		ensure => file,
		source => 'puppet:///modules/irpf_lin/IRPF2018-desktop.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}

	# Comandos para baixar o instalador
	file { 'irpf18.tgz':
		path => '/usr/local/src/irpf18.tgz',
		ensure => file,
		source => 'puppet:///modules/irpf_lin/irpf18.tgz',
		owner => root,
		group => root,
		mode => 777,
	}

	exec { 'descompactar_irpf18.tgz':
		command => '/bin/tar -x -z -C /usr/local/ -f /usr/local/src/irpf18.tgz ; /bin/chown -R root.root /usr/local/IRPF2018 ; /bin/chmod -R 1777 /usr/local/IRPF2018',
		require => [
				File['irpf18.tgz'],
		],
		# So executa se nao tiver o arquivo abaixo
		creates => '/usr/local/IRPF2018/irpf.jar',
		timeout => 0,
 }
# Removendo versao anterior
 file { 'remove_.tgz':
	 path => '/usr/local/src/irpf17.tgz',
	 ensure => absent,
 }
 file { 'remove_.desktop':
	 path => '/usr/share/applications/IRPF2017-desktop.desktop',
	 ensure => absent,
 }
 file { 'remove_pasta':
	 path => '/usr/local/IRPF2017',
	 ensure => absent,
	 recurse => true,
	 force => true,
 }
}
