class disable_ipv6 {
	#######Desabilitar IPV6
	file { '50-disable-ipv6.conf':
	  path => '/etc/sysctl.d/50-disable-ipv6.conf',
	  ensure => file,
	  source => 'puppet:///modules/disable_ipv6/50-disable-ipv6.conf',
	  owner => root,
	  group => root,
	  mode => 0644,
	}
}
