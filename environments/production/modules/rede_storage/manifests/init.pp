class rede_storage {
    package { 'ifenslave':
		ensure => latest,
	}
    package { 'vlan':
		ensure => latest,
	}

    case $hostname {
        "server-storage-1.sj.ifsc.edu.br": {$interface = 'puppet:///modules/rede_storage/interfaces.storage1'}
        "server-storage-1": {$interface = 'puppet:///modules/rede_storage/interfaces.storage1'}
        "server-storage-2.sj.ifsc.edu.br": {$interface = 'puppet:///modules/rede_storage/interfaces.storage2'}
        "server-storage-2": {$interface = 'puppet:///modules/rede_storage/interfaces.storage2'}
    }

    host { 'storage1.sj.ifsc.edu.br':
        ip           => '191.36.8.68',
        host_aliases => 'storage1',
    }
    host { 'storage2.sj.ifsc.edu.br':
        ip           => '191.36.8.69',
        host_aliases => 'storage2',
    }

	file {'interfaces':
        path => '/etc/network/interfaces',
	    ensure => file,
	    source => $interface,
	    owner => root,
	    group => root,
	    mode => 0644,
    }


    if $hostname == 'server-storage-1.sj.ifsc.edu.br' {
        file {'bonding.conf':
		path => '/etc/modprobe.d/bonding.conf',
		ensure => file,
		source => 'puppet:///modules/rede_storage/bonding.conf',
		owner => root,
		group => root,
		mode => 0644,
		require => Package['ifenslave'],
	}
    }

    if $hostname == 'server-storage-1.sj.ifsc.edu.br' {
    file {'modules':
		path => '/etc/modules',
		ensure => file,
		source => 'puppet:///modules/rede_storage/modules',
		owner => root,
		group => root,
		mode => 0644,
		require => Package['ifenslave'],
	}
    }
}
