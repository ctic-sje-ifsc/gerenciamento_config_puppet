class apagaaluno {

## copia o scrips e inclui no rc0 rc6
	file { 'apagaAluno.sh':
			path => '/etc/init.d/apagaAluno.sh',
			ensure => file,
			source => 'puppet:///modules/apagaaluno/apagaAluno.sh',
			owner => root,
			group => root,
			mode => 0755,
		}
	exec { 'update-rc.d':
			command => "/usr/sbin/update-rc.d apagaAluno.sh start 30 0 6 .",
			subscribe => File ['apagaAluno.sh'],
			refreshonly => true,
	}

}
