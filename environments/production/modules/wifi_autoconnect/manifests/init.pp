class wifi_autoconnect {

	package { 'wpasupplicant':
		ensure => latest,
	}

	file { 'wpa_supplicant.conf':
		path => '/etc/wpa_supplicant/wpa_supplicant.conf',
		ensure => file,
		source => 'puppet:///modules/wifi_autoconnect/wpa_supplicant.conf',
		owner => root,
		group => root,
		mode => 0644,
		require => Package['wpasupplicant'],
	}

	file { 'interfaces':
		path => '/etc/network/interfaces',
		ensure => file,
		source => 'puppet:///modules/wifi_autoconnect/interfaces',
		owner => root,
		group => root,
		mode => 0644,
		require => Package['wpasupplicant'],
	}
}
