class sistema {

	$source = $lsbdistcodename ? {
		#Debian 7 Wheezy
		wheezy	=> 'puppet:///modules/sistema/sources.list.wheezy',
		#Ubuntu 14.04 LTS
		trusty	=> 'puppet:///modules/sistema/sources.list.trusty',
		#Ubuntu 12.04 LTS
		precise	=> 'puppet:///modules/sistema/sources.list.precise',
		#Debian 8 Jessie
		jessie => 'puppet:///modules/sistema/sources.list.jessie',
		default	=> undef,
	}

	file { 'sources.list':
		path => '/etc/apt/sources.list',
		ensure => file,
		source => $source,
		owner => root,
		group => root,
		mode => 0644,
	}

	package { 'transmission-gtk':
		ensure => absent,
	}

	exec { 'apt-get update':
		command => "/usr/bin/apt-get update",
		subscribe => File ['sources.list'],
		schedule => daily,
	}
	exec { 'dpkg.configure':
		command => "/usr/bin/dpkg --configure -a",
		schedule => daily,
	}

	package { 'puppet':
		name => 'puppet',
		ensure => installed,
	}

	package { 'libcurl3':
		ensure => latest,
	}
	package { 'apt-transport-https':
		ensure => latest,
	}
	package { 'curl':
		ensure => latest,
	}
	package { 'lm-sensors':
		ensure => latest,
	}


if $lsbdistcodename == jessie {
	package { 'firmware-linux-nonfree':
		ensure => latest,
	}
	package { 'firmware-ralink':
		ensure => latest,
	}
	package { 'firmware-linux-free':
		ensure => latest,
	}
	package { 'firmware-linux':
		ensure => latest,
	}

}

	exec { "add_architecture":
   	command => '/usr/bin/dpkg --add-architecture i386 ; /usr/bin/apt-get update ; /usr/bin/touch /var/gatilho_add_architecture',
   	creates => '/var/gatilho_add_architecture',
	}

	file { 'puppet':
		path => '/etc/default/puppet',
		ensure => file,
		source => 'puppet:///modules/sistema/puppet',
		owner => root,
		group => root,
		mode => 0644,
	}

	file { 'puppet.conf':
		path => '/etc/puppet/puppet.conf',
		ensure => file,
		source => 'puppet:///modules/sistema/puppet.conf',
		owner => root,
		group => root,
		mode => 0644,
	}

	service { 'puppet':
		ensure => running,
		enable => true,
		subscribe => [
			File['puppet'],
			File['puppet.conf'],
		],
		require => Package['puppet'],
	}

## zabbix agent
	package { 'zabbix-agent':
		name => 'zabbix-agent',
		ensure => latest,
	}
	
	file { 'zabbix_agentd.conf':
		path => '/etc/zabbix/zabbix_agentd.conf',
		ensure => file,
		source => 'puppet:///modules/sistema/zabbix_agentd.conf',
		owner => root,
		group => root,
		mode => 0644,
	}

	service { 'zabbix-agent':
		ensure => running,
		enable => true,
		subscribe => [
			File['zabbix_agentd.conf'],
		],
		require => Package['zabbix-agent'],
	}
## fim do zabbix agent

#serve para que um usuario possa desligar a maquina mesmo com outro logado
	file { 'org.freedesktop.consolekit.policy':
		path => '/usr/share/polkit-1/actions/org.freedesktop.consolekit.policy',
		ensure => file,
		source => 'puppet:///modules/sistema/org.freedesktop.consolekit.policy',
		owner => root,
		group => root,
		mode => 0644,
	}

	include unattended-upgrades

	if $lsbdistcodename == jessie {
		package { 'pkg-mozilla-archive-keyring':
			ensure => latest,
		}
	}

## auto completar terminar

    file { '/etc/bash.bashrc':
        ensure => file,
        source => 'puppet:///modules/sistema/bash.bashrc',
        owner => root,
        group => root,
        mode => 0644,
    }

    package { 'bash-completion':
        ensure => latest,
    }

## fonte Garamound - registro

	file { '/usr/share/fonts/GARA.TTF':
         ensure => file,
         source => 'puppet:///modules/sistema/GARA.TTF',
         owner => root,
         group => root,
         mode => 0644,
    }

	file { '/usr/share/fonts/GARABD.TTF':
         ensure => file,
         source => 'puppet:///modules/sistema/GARABD.TTF',
         owner => root,
         group => root,
         mode => 0644,
    }
	file { '/usr/share/fonts/GARAIT.TTF':
         ensure => file,
         source => 'puppet:///modules/sistema/GARAIT.TTF',
         owner => root,
         group => root,
         mode => 0644,
    }	
}
