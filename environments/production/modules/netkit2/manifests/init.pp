# Classe Netkit2

class netkit2 {
	$list = ["graphviz", "python-vte", "bridge-utils", "uml-utilities"]
	package { $list:
		ensure => installed,
	}
	package { 'libc6-i386':
		ensure => installed,
	}
	file { 'netkit2_sudoers':
		path => '/etc/sudoers.d/netkit2',
		ensure => file,
        source => 'puppet:///modules/netkit2/netkit2',
        owner => root,
        group => root,
        mode => 0440,
	}

	file { 'netkit2_desktop':
		path => '/usr/share/applications/netkit2.desktop',
		ensure => file,
		source => 'puppet:///modules/netkit2/netkit2.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}

	file { 'netkit2_sh':
		path => '/etc/profile.d/netkit2.sh',
		ensure => file,
		source => 'puppet:///modules/netkit2/netkit2.sh',
		owner => root,
		group => root,
		mode => 0644,
	}

	# Comandos para baixar, extrair e apagar netkit2
	file { '/usr/local/netkit2':
		path => '/usr/local/netkit2',
		ensure => directory,
		owner => root,
		group => root,
		mode => 1777,
	}

	exec { 'wget_netkit2':
		command => '/usr/bin/wget http://tele.sj.ifsc.edu.br/~msobral/netkit2/install/netkit2.tar.bz2 -O - | tar -x -j -C /usr/local/netkit2 -f - ; /bin/chown -R root.root /usr/local/netkit2 ; /bin/chmod -R 1777 /usr/local/netkit2',
		require => [
				File['/usr/local/netkit2'],
				Package[$list],
		],
		# So executa se nao tiver o arquivo abaixo
		creates => '/usr/local/netkit2/netkit-version.txt',
		timeout => 0,
	}
	# O netkit2 possui um bug que o impede se atualizar. Para corrigi-lo, deve-se atualiza-lo manualmente com este procedimento
	exec { 'atualizacao_netkit2':
		command => '/usr/bin/wget -O ${NETKIT2_HOME}/bin/netkit2 http://tele.sj.ifsc.edu.br/~msobral/netkit2/bin/netkit2 ; /usr/bin/touch /usr/local/netkit2/atualizacao2.X ; /bin/rm /usr/local/netkit2/atualizacao2.1',
		creates => '/usr/local/netkit2/atualizacao2.X',
	}

}
