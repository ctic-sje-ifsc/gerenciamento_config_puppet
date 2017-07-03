class grub_save {

	file { 'grub':
		path => '/etc/default/grub',
		ensure => file,
		source => 'puppet:///modules/grub_save/grub',
		owner => root,
		group => root,
		mode => 0644,
	}
	exec { '/usr/sbin/update-grub':
		command => "/usr/sbin/update-grub",
		subscribe => File ['grub'],
		refreshonly => true,
	}

}
