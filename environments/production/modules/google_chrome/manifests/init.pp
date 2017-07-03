class google_chrome {

	package { 'google-chrome-stable':
		ensure => latest,
		require => [
				File ['source_google'],
				exec ['apt-get-update_google'],
				exec ['add_key_google'],
		],
	}

	file { 'source_google':
		path => '/etc/apt/sources.list.d/google-chrome.list',
		ensure => file,
		source => 'puppet:///modules/google_chrome/google-chrome.list',
		owner => root,
		group => root,
		mode => 0644,
	}

	exec { 'add_key_google':
		command => "/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1397BC53640DB551 ",
		subscribe => File ['source_google'],
		require => File ['source_google'],
		refreshonly => true,
	}


	exec { 'apt-get-update_google':
		command => "/usr/bin/apt-get update",
		subscribe => exec['add_key_google'],
		require => exec['add_key_google'],
		refreshonly => true,
	}


}
