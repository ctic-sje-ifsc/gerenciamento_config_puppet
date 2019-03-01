class irpf_lin {

	file { 'IRPF2019-desktop.desktop':
		path => '/usr/share/applications/IRPF2019-desktop.desktop',
		ensure => file,
		source => 'puppet:///modules/irpf_lin/IRPF2019-desktop.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}

	# Comandos para baixar o instalador
	file { 'irpf19.tgz':
		path => '/usr/local/src/irpf19.tgz',
		ensure => file,
		source => 'puppet:///modules/irpf_lin/irpf19.tgz',
		owner => root,
		group => root,
		mode => 777,
	}

	exec { 'descompactar_irpf19.tgz':
		command => '/bin/tar -x -z -C /usr/local/ -f /usr/local/src/irpf19.tgz ; /bin/chown -R root.root /usr/local/IRPF2019 ; /bin/chmod -R 1777 /usr/local/IRPF2019',
		require => [
				File['irpf19.tgz'],
		],
		# So executa se nao tiver o arquivo abaixo
		creates => '/usr/local/IRPF2019/irpf.jar',
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
