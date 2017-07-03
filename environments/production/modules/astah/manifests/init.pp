class astah {
	##INICIO DO astah

  	file { 'astah':
  		path => '/usr/share/applications/astah.desktop',
  		ensure => file,
  		source => 'puppet:///modules/astah/astah.desktop',
  		owner => root,
  		group => root,
  		mode => 644,
  		require => File['dir_astah'],
  	}

  	file { 'dir_astah':
  		path => '/opt/astah_community/',
  		ensure => file,
  		source => 'puppet:///modules/astah/astah_community',
  		owner => root,
  		group => root,
  		mode => 1775,
  		recurse => true,
  	}
}
