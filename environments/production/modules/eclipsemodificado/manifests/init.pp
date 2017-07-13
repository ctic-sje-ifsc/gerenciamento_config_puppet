# Classe Eclipse Modificado Arliones

class eclipsemodificado {

#	package { 'openjdk-7-jre':
#		name => 'openjdk-7-jre',
#		ensure => latest,
#	}

	file { 'eclipsemodificado.desktop':
		path => '/usr/share/applications/eclipsemodificado.desktop',
		ensure => file,
		source => 'puppet:///modules/eclipsemodificado/eclipsemodificado.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}

	# Comandos para baixar, extrair e apagar netkit2
	file { '/opt/eclipse':
		path => '/opt/eclipse',
		ensure => directory,
		owner => root,
		group => root,
		mode => 1777,
	}

	exec { 'wget_eclipse_modificado':
		command => '/usr/bin/wget http://tele.sj.ifsc.edu.br/~arliones.hoeller/eclipse-mars-modeling-x86_64.tar.bz2 -O - | tar -x -j -C /opt/ -f - ; /bin/chown -R root.root /opt/eclipse ; /bin/chmod -R 1777 /opt/eclipse',
		require => [
#				Package['openjdk-7-jre'],
				File['/opt/eclipse'],
		],
		# so executa se nao tiver o arquivo abaixo
		creates => '/opt/eclipse/eclipse',
		timeout => 0,
		onlyif => '/usr/bin/test $(/bin/uname -m) = x86_64',
	}

	exec { 'wget_eclipse_modificado_32':
		command => '/usr/bin/wget http://tele.sj.ifsc.edu.br/~arliones.hoeller/eclipse-mars-modeling-i386.tar.bz2 -O - | tar -x -j -C /opt/ -f - ; /bin/chown -R root.root /opt/eclipse ; /bin/chmod -R 1777 /opt/eclipse ',
		require => [
#				Package['openjdk-7-jre'],
				File['/opt/eclipse'],
		],
		# so executa se nao tiver o arquivo abaixo
		creates => '/opt/eclipse/eclipse',
		timeout => 0,
		onlyif => ["/usr/bin/test $(/bin/uname -m) = i386", "/usr/bin/test $(/bin/uname -m) = i486", "/usr/bin/test $(/bin/uname -m) = i586", "/usr/bin/test $(/bin/uname -m) = i686"]
	}

}
