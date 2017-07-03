class chave_compartilhada {

	package { 'keychain':
		ensure => installed,
	}
	file { 'id_rsa':
			path => '/root/.ssh/id_rsa',
			ensure => file,
			source => 'puppet:///modules/chave_compartilhada/id_rsa',
			owner => root,
			group => root,
			mode => 0600,
	}
	file { 'authorized_keys':
			path => '/root/.ssh/authorized_keys',
			ensure => file,
			source => 'puppet:///modules/chave_compartilhada/authorized_keys',
			owner => root,
			group => root,
			mode => 0600,
	}
	file { 'id_rsa.pub':
			path => '/root/.ssh/id_rsa.pub',
			ensure => file,
			source => 'puppet:///modules/chave_compartilhada/id_rsa.pub',
			owner => root,
			group => root,
			mode => 0644,
	}
	file { 'ssh':
			path => '/root/.ssh',
			ensure => directory,
			owner => root,
			group => root,
			mode => 0700,
	}
	file { '.bashrc':
			path => '/root/.bashrc',
			ensure => file,
			source => 'puppet:///modules/chave_compartilhada/.bashrc',
			owner => root,
			group => root,
			mode => 0644,
	}


}
