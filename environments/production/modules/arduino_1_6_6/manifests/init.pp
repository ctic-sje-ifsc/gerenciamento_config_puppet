# Classe Arduino 1.6.6 

class arduino_1_6_6 {
	
#	package { 'openjdk-7-jre':
#		name => 'openjdk-7-jre',
#		ensure => installed,
#	}
	
	file { 'arduino_1_6_6':
		path => '/usr/share/applications/arduino_1_6_6.desktop',
		ensure => file,
		source => 'puppet:///modules/arduino_1_6_6/arduino_1_6_6.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}
	
	# Comandos para baixar o instalador	
	file { 'arduino-1.6.6-linux64.tar.xz':
		path => '/usr/local/src/arduino-1.6.6-linux64.tar.xz',
		ensure => file,
		source => 'puppet:///modules/arduino_1_6_6/arduino-1.6.6-linux64.tar.xz',
		owner => root,
		group => root,
		mode => 777,
	}

	file { 'arduino-1.6.6-linux32.tar.xz':
        path => '/usr/local/src/arduino-1.6.6-linux32.tar.xz',
        ensure => file,
        source => 'puppet:///modules/arduino_1_6_6/arduino-1.6.6-linux32.tar.xz',
        owner => root,
        group => root,
        mode => 777,
    }

	exec { 'descompactar_arduino-1.6.6-linux64.tar.xz':
		command => '/bin/tar -x -J -C /opt/ -f /usr/local/src/arduino-1.6.6-linux64.tar.xz ; /bin/chown -R root.root /opt/arduino-1.6.6 ; /bin/chmod -R 1777 /opt/arduino-1.6.6',
		require => [ 
				File['arduino-1.6.6-linux64.tar.xz'],
		],
		# so executa senao tiver o arquivo abaixo
		creates => '/opt/arduino-1.6.6/arduino',
		timeout => 0,
		onlyif => '/usr/bin/test $(/bin/uname -m) = x86_64',
	}
	
	exec { 'descompactar_arduino-1.6.6-linux32.tar.xz':
	command => '/bin/tar -x -J -C /opt/ -f /usr/local/src/arduino-1.6.6-linux32.tar.xz ; /bin/chown -R root.root /opt/arduino-1.6.6 ; /bin/chmod -R 1777 /opt/arduino-1.6.6',
        require => [ 
                File['arduino-1.6.6-linux32.tar.xz'],
        ],	
	# so executa se nao tiver o arquivo abaixo
		creates => '/opt/arduino-1.6.6/arduino',
		timeout => 0,
		onlyif => '/usr/bin/test $(/bin/uname -m) = i686',
	}
	
}
