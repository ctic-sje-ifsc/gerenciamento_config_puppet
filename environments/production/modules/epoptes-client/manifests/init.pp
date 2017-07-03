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
		/^sj-labcad1/: {$epoptes_server = '172.18.132.1'}
		/^sj-labcad2/: {$epoptes_server = '172.18.133.1'}
		/^sj-labcad3/: {$epoptes_server = '172.18.134.1'}
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
/* ANTIGO USO DO RCLOCAL COM CONCAT
		adiciona no rc.local o epoptes para se pegar o certificado do server e iniciar
		necessario usar o modulo rclocal

	concat::fragment { '04_rc.local_epoptes_config':
        target => '/etc/rc.local',
        #content => "# Adquire o certificado do server e iniciar o epoptes-client\nepoptes-client -c\nepoptes-client&\n",
        content => "# Adquire o certificado do server e iniciar o epoptes-client\nepoptes-client -c",
        order => '04',
    }
*/
}
