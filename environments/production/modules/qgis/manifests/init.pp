class qgis {

	package { 'qgis':
		ensure => latest,
		require => [
				File ['source_qgis'],
				Exec ['apt-get-update_qgis'],
				Exec ['add_key_qgis'],
		],
		install_options => ['--allow-unauthenticated', '-y', '--force-yes'],
	}
	package { 'python-qgis':
		ensure => latest,
		require => [
				File ['source_qgis'],
				Exec ['apt-get-update_qgis'],
				Exec ['add_key_qgis'],
		],
		install_options => ['--allow-unauthenticated', '-y', '--force-yes'],
	}
	package { 'qgis-plugin-grass':
		ensure => latest,
		require => [
				File ['source_qgis'],
				Exec ['apt-get-update_qgis'],
				Exec ['add_key_qgis'],
		],
		install_options => ['--allow-unauthenticated', '-y', '--force-yes'],
	}

	$source = $lsbdistcodename ? {
		trusty	=> 'puppet:///modules/qgis/qgis.trusty.list',
		jessie => 'puppet:///modules/qgis/qgis.jessie.list',
	}

	file { 'source_qgis':
		path => '/etc/apt/sources.list.d/qgis.list',
		ensure => file,
		source => $source,
		owner => root,
		group => root,
		mode => 0644,
	}

	exec { 'add_key_qgis':
		command => "/usr/bin/wget -O - https://qgis.org/downloads/qgis-2017.gpg.key | gpg --import ; /usr/bin/gpg --fingerprint CAEB3DC3BDF7FB45 ; /usr/bin/gpg --export --armor CAEB3DC3BDF7FB45 | sudo apt-key add - ; /bin/rm /var/gatinho_key_qgis ; /bin/rm /var/gatinho_key_qgis2 ; /usr/bin/touch /var/gatinho_key_qgis3",
		creates => "/var/gatinho_key_qgis3";
	}
	exec { 'apt-get-update_qgis':
		command => "/usr/bin/apt-get update",
		subscribe => exec['add_key_qgis'],
		require => exec['add_key_qgis'],
		refreshonly => true,
	}

}
