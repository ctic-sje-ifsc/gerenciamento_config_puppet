class dhcp_auto{

	if $lsbdistcodename == jessie {
		file { 'interfaces':
			path => '/etc/network/interfaces',
			ensure => file,
			source => 'puppet:///modules/dhcp_auto/interfaces',
			owner => root,
			group => root,
			mode => 0644,
		}
	}

}
