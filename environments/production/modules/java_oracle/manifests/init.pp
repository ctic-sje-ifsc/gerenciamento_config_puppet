class java_oracle {

#retirado de http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html

	file { 'source_oracle_java':
		path => '/etc/apt/sources.list.d/webupd8team-java.list',
		ensure => file,
		source => 'puppet:///modules/java_oracle/webupd8team-java.list',
		owner => root,
		group => root,
		mode => 0644,
	}

	file { 'deployment.config':
		path => '/etc/.java/deployment/deployment.config',
		ensure => file,
		source => 'puppet:///modules/java_oracle/deployment.config',
		owner => root,
		group => root,
		mode => 0644,
		require => Package ['oracle-java8-installer'],
	}

	file { 'deployment.properties':
		path => '/etc/.java/deployment/deployment.properties',
		ensure => file,
		source => 'puppet:///modules/java_oracle/deployment.properties',
		owner => root,
		group => root,
		mode => 0644,
		require => Package ['oracle-java8-installer'],
	}

	file { 'exception.sites':
		path => '/etc/.java/deployment/exception.sites',
		ensure => file,
		source => 'puppet:///modules/java_oracle/exception.sites',
		owner => root,
		group => root,
		mode => 0644,
		require => Package ['oracle-java8-installer'],
	}

	file { 'deployment':
		path => '/etc/.java/deployment',
		ensure => directory,
		owner => root,
		group => root,
		mode => 0755,
		require => Package ['oracle-java8-installer'],
	}

	exec { 'add_key_oracle_java':
		command => "/usr/bin/apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886",
		subscribe => File ['source_oracle_java'],
		require => File ['source_oracle_java'],
		refreshonly => true,
	}

	exec { 'apt-get-update_java':
		command => "/usr/bin/apt-get update",
		subscribe => exec['add_key_oracle_java'],
		require => exec['add_key_oracle_java'],
		refreshonly => true,
	}

	exec { 'license_acc':
		command => "/bin/echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/sudo /usr/bin/debconf-set-selections",
		subscribe => exec['apt-get-update_java'],
		require => exec['add_key_oracle_java'],
		refreshonly => true,
	}

	package { 'oracle-java8-installer':
		ensure => latest,
		require => [
				File ['source_oracle_java'],
				exec ['apt-get-update_java'],
				exec ['add_key_oracle_java'],
				exec ['license_acc'],
		],
	}

}
