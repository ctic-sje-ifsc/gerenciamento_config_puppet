class config_rede_labs_2 {

##DEPENDENCIA DE PACOTES
	#package { 'network-manager':
  #      ensure => absent,
  #}
	##

	##CONFIGURA O NETWORK INTERFACES
	case $hostname {
		"sj-lin-labinf-756045": {$interface = 'puppet:///modules/config_rede_labs_2/interfaces.prof.informatica'}
		"sj-lin-labinf-756045.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs_2/interfaces.prof.informatica'}
		"sj-labcad1-37247": {$interface = 'puppet:///modules/config_rede_labs_2/interfaces.prof.cad1'}
		"sj-labcad1-37247.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs_2/interfaces.prof.cad1'}
		"sj-labcad3-prof": {$interface = 'puppet:///modules/config_rede_labs_2/interfaces.prof.cad3'}
		"sj-labcad3-prof.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs_2/interfaces.prof.cad3'}
		"sj-labcad2-38841": {$interface = 'puppet:///modules/config_rede_labs_2/interfaces.prof.cad2'}
		"sj-labcad2-38841.sj.ifsc.edu.br": {$interface = 'puppet:///modules/config_rede_labs_2/interfaces.prof.cad2'}
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

}
