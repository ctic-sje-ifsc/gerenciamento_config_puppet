# Classe Netbeans 8.2

class netbeans_8_2 {

#	package { 'openjdk-7-jre':
#		name => 'openjdk-7-jre',
#		ensure => latest,
#	}

	file { 'netbeans-8.2.desktop':
		path => '/usr/share/applications/netbeans-8.2.desktop',
		ensure => file,
		source => 'puppet:///modules/netbeans_8_2/netbeans-8.2.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}

	# Comandos para baixar o instalador
	file { 'netbeans_8_2.tgz':
		path => '/usr/local/src/netbeans_8_2.tgz',
		ensure => file,
		source => 'puppet:///modules/netbeans_8_2/netbeans_8_2.tgz',
		owner => root,
		group => root,
		mode => 777,
	}
	file { 'netbeans.conf':
		path => '/usr/local/netbeans-8.2/etc/netbeans.conf',
		ensure => file,
		source => 'puppet:///modules/netbeans_8_2/netbeans.conf',
		owner => root,
		group => root,
		mode => 0644,
	}
	exec { 'descompactar_netbeans_8_2.tgz':
		command => '/bin/tar -x -z -C /usr/local/ -f /usr/local/src/netbeans_8_2.tgz ; /bin/chown -R root.root /usr/local/netbeans-8.2 ; /bin/chmod -R 1777 /usr/local/netbeans-8.2; /bin/chown -R root.root /usr/local/glassfish-4.1.1 ; /bin/chmod -R 1777 /usr/local/glassfish-4.1.1',
		require => [
				File['netbeans_8_2.tgz'],
		],
		# so executa senao tiver o arquivo abaixo
		creates => '/usr/local/netbeans-8.2/bin/netbeans',
		timeout => 0,
 }
}
