class qgis {

	package { 'qgis':
		ensure => latest,
		require => [
				File ['source_qgis'],
				exec ['apt-get-update_qgis'],
				exec ['add_key_qgis'],
		],
	}
	package { 'python-qgis':
		ensure => latest,
		require => [
				File ['source_qgis'],
				exec ['apt-get-update_qgis'],
				exec ['add_key_qgis'],
		],
	}
	package { 'qgis-plugin-grass':
		ensure => latest,
		require => [
				File ['source_qgis'],
				exec ['apt-get-update_qgis'],
				exec ['add_key_qgis'],
		],
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
		command => "/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 073D307A618E5811 ; /usr/bin/touch /var/gatinho_key_qgis",
	creates => "/var/gatinho_key_qgis";
	}
	exec { 'apt-get-update_qgis':
		command => "/usr/bin/apt-get update",
		subscribe => exec['add_key_qgis'],
		require => exec['add_key_qgis'],
		refreshonly => true,
	}

}
