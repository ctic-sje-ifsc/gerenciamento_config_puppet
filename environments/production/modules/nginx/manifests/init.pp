class nginx {

	package { 'nginx':
		ensure => installed,
	}

	service { 'nginx':
		ensure => running,
		enable => true,
	}

	file { 'nginx.conf':
		path => '/etc/nginx/nginx.conf',
		source => 'puppet:///modules/nginx/nginx.conf',
		owner => root,
		group => root,
		mode => 0640,
	}

	file { '/etc/nginx/sites-available/web1':
		path => '/etc/nginx/sites-available/web1',
		source => 'puppet:///modules/nginx/web1',
		owner => root,
		group => root,
		mode => 0644,
	}

#	file { '/etc/nginx/sites-available/web1.link':
#		path => '/etc/nginx/sites-available/web1',
#   		ensure => 'link',
#   		target => '/etc/nginx/sites-enable/web1',
#	}
	
	file { '/etc/nginx/sites-available/web2':
		path => '/etc/nginx/sites-available/web2',
		source => 'puppet:///modules/nginx/web2',
		owner => root,
		group => root,
		mode => 0644,
	}
	
	package { 'php5-fpm':
		ensure => installed,
	}

	service { 'php5-fpm':
		ensure => running,
	}

}

