class epoptes-client {

	package { 'epoptes-client':
		ensure => latest,
	}
	package { 'epoptes':
		ensure => absent,
	}

	case $hostname {
		/^sj-labalu-/: {$epoptes_server = '192.168.4.254'}
		/sj-labin/: {$epoptes_server = '172.18.135.1'}
		default: { $epoptes_server = '192.168.1.1' }
	}

	host { 'server':
        ip => $epoptes_server,
    }
##remove o cron
	 cron { certificado:
  		command => "/usr/sbin/epoptes-client -c ",
  		user    => root,
  		minute  => '*/5',
			ensure => absent,
	 }
}
