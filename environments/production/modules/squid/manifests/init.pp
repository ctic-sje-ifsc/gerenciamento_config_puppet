class squid {

	package { 'squid3':
		ensure => installed,
	}

	file { 'squid.conf':
		path => '/etc/squid3/squid.conf',
		ensure => file,
		source => 'puppet:///modules/squid/squid.conf',
		owner => root,
		group => root,
		mode => 0644,
	}
	
	file { 'portaldoaluno.txt':
		path => '/etc/squid3/portaldoaluno.txt',
		ensure => file,
		source => 'puppet:///modules/squid/portaldoaluno.txt',
		owner => root,
		group => root,
		mode => 0644,
	}
	
	file { 'repositorio.txt':
		path => '/etc/squid3/repositorio.txt',
		ensure => file,
		source => 'puppet:///modules/squid/repositorio.txt',
		owner => root,
		group => root,
		mode => 0644,
	}
	
	service { 'squid3':
		ensure => running,
		enable => true,
		subscribe => File ['puppet.conf'],
		require => Package ['squid3'],
	}

	package { 'sarg':
		ensure => installed,
	}

	package { 'apache2':
		ensure => installed,
	}
	
	service { 'apache2':
		ensure => running,
		enable => true,
		subscribe => File ['wpad.dat'],
		require => Package ['apache2'],
	}

	file { 'wpad.dat':
		path => '/var/www/wpad.dat',
		ensure => file,
		source => 'puppet:///modules/squid/wpad.dat',
		owner => root,
		group => root,
		mode => 0644,
	}	

	package { 'bind9':
		ensure => installed,
	}

	service { 'bind9':
        ensure => running,
        enable => true,
        require => Package ['bind9'],
		subscribe => File ['aluno.sj.ifsc.edu.br', 'named.conf.local', 'named.conf.options' ],
    }

	file { 'named.conf.local':
		path => '/etc/bind/named.conf.local',
		ensure => file,
		source => 'puppet:///modules/squid/named.conf.local',
		owner => root,
		group => root,
		mode => 0644,
	}	

	file { 'aluno.sj.ifsc.edu.br':
		path => '/etc/bind/aluno.sj.ifsc.edu.br',
		ensure => file,
		source => 'puppet:///modules/squid/aluno.sj.ifsc.edu.br',
		owner => root,
		group => root,
		mode => 0644,
	}	
	
	file { 'named.conf.options':
		path => '/etc/bind/named.conf.options',
		ensure => file,
		source => 'puppet:///modules/squid/named.conf.options',
		owner => root,
		group => root,
		mode => 0644,
	}

}
