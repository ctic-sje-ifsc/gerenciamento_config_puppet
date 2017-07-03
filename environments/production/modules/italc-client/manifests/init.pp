class italc-client {

	package { 'italc-client/wheezy-backports':
		ensure => installed,
	}

	exec { 'criar diretorio para ica':
		command => "/bin/mkdir -p /home/aluno/.config/autostart"
	}

	file { 'ica.desktop':
		path => '/home/aluno/.config/autostart/ica.desktop',
		ensure => file,
		source => 'puppet:///modules/italc-client/ica.desktop',
		owner => aluno,
		group => aluno,
		mode => 0644,
	}

	file { [ '/etc/italc/keys/', '/etc/italc/keys/public/' , '/etc/italc/keys/public/teacher/' ]:
		ensure => directory,
		owner => root,
		group => root,
		mode => 0755,
	}

	file { 'key-public':
        path => '/etc/italc/keys/public/teacher/key',
        ensure => file,
        source => 'puppet:///modules/italc-client/key',
        owner => root,
        group => root,
        mode => 0444,
		require => File['/etc/italc/keys/public/teacher/'],
    }

	file { 'italc.conf':
        path => '/etc/italc/italc.conf',
        ensure => file,
        source => 'puppet:///modules/italc-client/italc.conf',
        owner => root,
        group => root,
        mode => 0444,
        require => Package['italc-client/wheezy-backports'],
    }

	file { 'iTALC.conf':
        path => "/etc/xdg/iTALC Solutions/iTALC.conf",
        ensure => file,
        source => 'puppet:///modules/italc-client/italc.conf',
        owner => root,
        group => root,
        mode => 0444,
        require => Package['italc-client/wheezy-backports'],
    }
}
