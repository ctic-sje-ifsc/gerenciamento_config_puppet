# Classe Netbeans 8.0.2

class netbeans8 {

#	package { 'openjdk-7-jre':
#		name => 'openjdk-7-jre',
#		ensure => latest,
#	}

# desistalando

	file { 'netbeans8.desktop':
		path => '/usr/share/applications/netbeans-8.0.2.desktop',
		ensure => absent,
	}
	file { 'netbeans8.tgz':
		path => '/usr/local/src/netbeans8.tgz',
		ensure => absent,
	}
 	file { 'netbeans-8.0.2':
	 	path => '/usr/local/netbeans-8.0.2',
		force => yes,
	 	ensure => absent,
 	}

/* instalacao
 file { 'netbeans8.desktop':
	 path => '/usr/share/applications/netbeans-8.0.2.desktop',
	 ensure => file,
	 source => 'puppet:///modules/netbeans8/netbeans-8.0.2.desktop',
	 owner => root,
	 group => root,
	 mode => 0644,
 }

 # Comandos para baixar o instalador
 file { 'netbeans8.tgz':
	 path => '/usr/local/src/netbeans8.tgz',
	 ensure => file,
	 source => 'puppet:///modules/netbeans8/netbeans8.tgz',
	 owner => root,
	 group => root,
	 mode => 777,
 }

 exec { 'descompactar_netbeans8.tgz':
	 command => '/bin/tar -x -z -C /usr/local/ -f /usr/local/src/netbeans8.tgz ; /bin/chown -R root.root /usr/local/netbeans-8.0.2 ; /bin/chmod -R 1777 /usr/local/netbeans-8.0.2; /bin/chown -R root.root /usr/local/glassfish-4.1 ; /bin/chmod -R 1777 /usr/local/glassfish-4.1',
	 require => [
			 File['netbeans8.tgz'],
	 ],
	 # so executa senao tiver o arquivo abaixo
	 creates => '/usr/local/netbeans-8.0.2/bin/netbeans',
	 timeout => 0,
}*/
}
