class openjdk-8-jre {

	file { 'source_openjdk':
		path => '/etc/apt/sources.list.d/openjdk.list',
		ensure => file,
		source => 'puppet:///modules/openjdk-8-jre/openjdk.list',
		owner => root,
		group => root,
		mode => 0644,
	}

	exec { 'add_key_openjdk_8':
		command => "/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB9B1D8886F44E2A ",
		subscribe => File ['source_openjdk'],
		require => File ['source_openjdk'],
		refreshonly => true,
	}
	exec { 'apt-get-update_openjdk_8':
		command => "/usr/bin/apt-get update",
		subscribe => exec['add_key_openjdk_8'],
		require => exec['add_key_openjdk_8'],
		refreshonly => true,
	}

	exec { 'update-alternatives_java':
		command => "/usr/bin/update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java ",
		subscribe => package['openjdk-8-jre'],
		require => package['openjdk-8-jre'],
		refreshonly => true,
	}

	package { 'openjdk-8-jre':
		ensure => latest,
		require => [
				File ['source_openjdk'],
				exec ['apt-get-update_openjdk_8'],
				exec ['add_key_openjdk_8'],
		],
	}

}
