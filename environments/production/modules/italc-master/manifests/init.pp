class italc-master {

	package { 'libitalccore/wheezy-backports':
    	ensure => installed,
	}
	
	package { 'italc-master/wheezy-backports':
    	ensure => installed,
		require => Package['italc-client/wheezy-backports'],
	}

	file { [ '/etc/italc/keys/private/' , '/etc/italc/keys/private/teacher/' ]:
        ensure => directory,
        owner => root,
        group => root,
        mode => 0755,
    }

    file { 'key-private':
        path => '/etc/italc/keys/private/teacher/key',
        ensure => file,
        source => 'puppet:///modules/italc-master/key',
        owner => aluno,
        group => aluno,
        mode => 0440,
        require => File['/etc/italc/keys/private/teacher/'],
    }

}
