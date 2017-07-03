class unattended-upgrades {

	package {'unattended-upgrades':
		ensure => latest,
	}

	file { '20auto-upgrades':
        path => '/etc/apt/apt.conf.d/20auto-upgrades',
        ensure => file,
        source => 'puppet:///modules/unattended-upgrades/20auto-upgrades',
        owner => root,
        group => root,
        mode => 0644,
    }

	file { '20auto-upgrades.ucf-dist':
		path => '/etc/apt/apt.conf.d/20auto-upgrades.ucf-dist',
		ensure => absent,
	}

	file { '02periodic':
        path => '/etc/apt/apt.conf.d/02periodic',
        ensure => absent,
    }
		file { '10periodic':
					path => '/etc/apt/apt.conf.d/10periodic',
					ensure => file,
					source => 'puppet:///modules/unattended-upgrades/10periodic',
					owner => root,
					group => root,
					mode => 0644,
			}

	$50unattended = $lsbdistcodename ? {
        #Debian 7 Wheezy
        wheezy  => 'puppet:///modules/unattended-upgrades/50unattended-upgrades.debian',
        #Debian 8 Jessie
        jessie  => 'puppet:///modules/unattended-upgrades/50unattended-upgrades.debian',
        #Ubuntu 14.04 LTS
        trusty  => 'puppet:///modules/unattended-upgrades/50unattended-upgrades.ubuntu',
        default => undef,
    }

	file { '50unattended-upgrades':
        path => '/etc/apt/apt.conf.d/50unattended-upgrades',
        ensure => file,
        source => $50unattended,
        owner => root,
        group => root,
        mode => 0644,
    }


}
