class octave {

	package { 'octave':
		ensure => latest,
		require => [
				File['source_octave'],
				Exec['apt-get-update_octave'],
				Exec['add_key_octave'],
		],
		install_options => ['--allow-unauthenticated', '-y', '--force-yes'],
	}
	package { 'liboctave-dev':
		ensure => latest,
		require => [
				Package ['octave'],
				File ['source_octave'],
				exec ['apt-get-update_octave'],
				exec ['add_key_octave'],
		],
		install_options => ['--allow-unauthenticated', '-y', '--force-yes'],
	}

	$list_octave = [ "octave-communications", "octave-control", "octave-signal" ]
	package { $list_octave:
		ensure => latest,
		require => [
				Package ['octave'],
				File ['source_octave'],
				exec ['apt-get-update_octave'],
				exec ['add_key_octave'],
		],
		install_options => ['--allow-unauthenticated', '-y', '--force-yes'],
	}

	$source = $lsbdistcodename ? {
		trusty	=> 'puppet:///modules/octave/octave.list',
		jessie => 'puppet:///modules/octave/octave.deb.list',
	}

	file { 'source_octave':
		path => '/etc/apt/sources.list.d/octave.list',
		ensure => file,
		source => $source,
		owner => root,
		group => root,
		mode => 0644,
	}

	exec { 'add_key_octave':
		command => "/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F2D377DDCB1CB6E ",
		subscribe => File ['source_octave'],
		require => File ['source_octave'],
		refreshonly => true,
	}
	exec { 'apt-get-update_octave':
		command => "/usr/bin/apt-get update",
		subscribe => Exec['add_key_octave'],
		require => Exec['add_key_octave'],
		refreshonly => true,
	}


}
