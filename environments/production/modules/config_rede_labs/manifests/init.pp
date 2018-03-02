class config_rede_labs {
###configura rede interna dos laboratorios com duas interfaces de rede, rede interna e dhcp

##DEPENDENCIA DE PACOTES
	package { 'network-manager':
        ensure => absent,
  }
	package { 'isc-dhcp-server':
		ensure => installed,
	}
	##

	##CONFIGURA A REDE INTERNA
	case $hostname {
		"sj-labprog-38111.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.prog'}
		"sj-labprog-38111": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.prog'}
		"sj-apoio-38114.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.apoio'}
		"sj-apoio-38114": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.apoio'}
		"sj-redes1-744530.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.redes1'}
		"sj-redes1-744530": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.redes1'}
		"sj-lin-redes2-703872.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.redes2'}
		"sj-lin-redes2-703872": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.redes2'}
		"sj-lab-bkp-744521": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.bkp'}
		"sj-labcad1-37247.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.cad1'}
		"sj-labcad1-37247": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.cad1'}
		"sj-labcad2-38841.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.cad2'}
		"sj-labcad2-38841": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.cad2'}
		"sj-lin-cad3-744528.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.cad3'}
		"sj-lin-cad3-744528": {$interface = 'puppet:///modules/config_rede_labs/interfaces.prof.cad3'}
	}

	file { 'file.interfaces':
			path => '/etc/network/interfaces',
			ensure => file,
			source => $interface,
			owner => root,
			group => root,
			mode => 0644,
	}
	##

	##CONFIGURA O ENCAMINHAMENTO
	file { 'sysctl.conf':
			path => '/etc/sysctl.conf',
			ensure => file,
			source => 'puppet:///modules/config_rede_labs/sysctl.conf',
			owner => root,
			group => root,
			mode => 0644,
	}
	exec { 'sysctl':
			command => "/sbin/sysctl -p /etc/sysctl.conf",
			subscribe => File ['sysctl.conf'],
			refreshonly => true,
	}
	exec { 'restart.procps':
		command => "/etc/init.d/procps restart",
		subscribe => File ['sysctl.conf'],
		refreshonly => true,
	}
	##

	## CONFIGURA O DHCP INTERNO AO LAB
	file { 'dhcpd.conf':
			path => '/etc/dhcp/dhcpd.conf',
			ensure => file,
			source => 'puppet:///modules/config_rede_labs/dhcpd.conf',
			owner => root,
			group => root,
			mode => 0644,
			require => Package ['isc-dhcp-server'],
	}
	exec { 'restart.dhcp':
		command => "/etc/init.d/isc-dhcp-server restart",
		subscribe => File ['dhcpd.conf'],
		refreshonly => true,
	}
##


## CONFIGURA O NAT E O FIREWALL
	file { 'firewall.sh':
			path => '/etc/init.d/firewall.sh',
			ensure => file,
			source => 'puppet:///modules/config_rede_labs/firewall.sh',
			owner => root,
			group => root,
			mode => 0755,
		}
	exec { 'update-rc':
			command => "/usr/sbin/update-rc.d firewall.sh start 99 2 3 4 5 .",
			subscribe => File ['firewall.sh'],
			refreshonly => true,
	}
	##

}
