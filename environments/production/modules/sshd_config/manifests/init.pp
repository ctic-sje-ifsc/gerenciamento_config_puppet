class sshd_config {

	file { 'issue.net.ifsc':
		path => '/etc/issue.net.ifsc',
		ensure => file,
		source => 'puppet:///modules/sshd_config/issue.net.ifsc',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'sshd_config':
		path => '/etc/ssh/sshd_config',
		ensure => file,
		source => 'puppet:///modules/sshd_config/sshd_config',
		owner => root,
		group => root,
		mode => 0644,
	}

	exec { '/etc/init.d/ssh restart':
		command => "/usr/bin/service ssh restart",
		subscribe => File ['sshd_config'],
		refreshonly => true,
	}

}
