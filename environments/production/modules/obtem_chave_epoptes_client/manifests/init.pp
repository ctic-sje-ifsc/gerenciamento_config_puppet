class obtem_chave_epoptes_client {

	exec { 'obtem_chave_epoptes':
		command => "/usr/bin/killall -9 socat ; /usr/sbin/epoptes-client -c ; /usr/bin/touch /var/gatilho_obtem_epoptes",
		creates => "/var/gatilho_obtem_epoptes",
	}

}
