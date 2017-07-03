class grub_soh_lin {

	file { 'grub':
		path => '/etc/default/grub',
		ensure => file,
		source => 'puppet:///modules/grub_soh_lin/grub',
		owner => root,
		group => root,
		mode => 0644,
	}
	exec { '/usr/sbin/update-grub':
		command => "/usr/sbin/update-grub",
		subscribe =>  File ['grub'],
		refreshonly => true,
	}
	#file { '10_linux':
	#	path => '/etc/grub.d/10_linux',
	#	ensure => file,
	#	source => 'puppet:///modules/grub_soh_lin/10_linux',
	#	owner => root,
	#	group => root,
	#	mode => 0755,
	#}
	#file { '40_custom':
	#	path => '/etc/grub.d/40_custom',
	#	ensure => file,
	#	source => 'puppet:///modules/grub_soh_lin/40_custom',
	#	owner => root,
	#	group => root,
	#	mode => 0755,
	#}

}
