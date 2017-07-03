class foxit {

	file { 'foxit.desktop':
		path => '/usr/share/applications/foxit.desktop',
		ensure => file,
		source => 'puppet:///modules/foxit/foxit.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}

	file { 'foxitsoftware':
		path => '/opt/foxitsoftware/',
		ensure => file,
		source => 'puppet:///modules/foxit/foxitsoftware',
		owner => root,
		group => root,
		mode => 1775,
		recurse => true,
	}
}
