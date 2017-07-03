# Classe Zoiper

class zoiper3-3 {


	file { 'zoiper3-3':
		path => '/usr/share/applications/zoiper3-3.desktop',
		ensure => file,
		source => 'puppet:///modules/zoiper3-3/zoiper3-3.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}

	file { 'zoiper.png':
		path => '/usr/share/pixmaps/zoiper.png',
		ensure => file,
		source => 'puppet:///modules/zoiper3-3/zoiper.png',
		owner => root,
		group => root,
		mode => 0644,
	}

	# Comandos para baixar o instalador
	file { 'zoiper64.tgz':
		path => '/usr/local/src/zoiper64.tgz',
		ensure => file,
		source => 'puppet:///modules/zoiper3-3/zoiper64.tgz',
		owner => root,
		group => root,
		mode => 777,
	}


	exec { 'descompactar_zoiper64.tgz':
		command => '/bin/tar -x -z -C /opt/ -f /usr/local/src/zoiper64.tgz ; /bin/chown -R root.root /opt/Zoiper64 ; /bin/chmod -R 1777 /opt/Zoiper64',
		require => [
				File['zoiper64.tgz'],
		],
		# so executa senao tiver o arquivo abaixo
		creates => '/opt/Zoiper64/zoiper',
		timeout => 0,
		onlyif => '/usr/bin/test $(/bin/uname -m) = x86_64',
	}

}
