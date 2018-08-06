class atualiza_mac {

##utilizado para atualizar o mac das maquinas virtuais

#exec { 'rm_gatilho':
#	command => "/bin/rm /var/gatilho_tar",
#	timeout => 0,
#	schedule => daily,
#}

	exec { 'atualiza_mac':
 		command => "/bin/mv /home/backup/aluno.tgz /home/backup/aluno-$(date +'%d-%m-%Y').tgz ; /bin/tar -zcvf /home/backup/aluno.tgz /home/aluno ; /usr/bin/touch /var/gatilho_tar_2; /bin/rm -rf /var/gatilho_tar",
 		timeout => 0,
 		require => exec[atualiza_tar],
 		creates => '/var/gatilho_tar_2',
  }
  exec { 'atualiza_tar':
 		command => "/bin/rm -rf /home/aluno	;tar -zxvf /home/backup/aluno.tgz -C / ; /bin/su -c '/usr/bin/VBoxManage modifyvm 1-Grafico --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 2-Grafico --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 3-Grafico --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 4-Grafico --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 5-Grafico --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 6-Grafico --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 1-Servidor --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 2-Servidor --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 3-Servidor --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 4-Servidor --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 5-Servidor --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 6-Servidor --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 7-Servidor --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 8-Servidor --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 9-Servidor --macaddress1 auto --macaddress2 auto ; /usr/bin/VBoxManage modifyvm 10-Servidor --macaddress1 auto --macaddress2 auto' aluno ;",
 		timeout => 0,
 		creates => '/var/gatilho_tar_2',
 		require => exec['tar_att'],
  }


	exec { 'tar_att':
 		command => "/bin/cp /home/backup/original_aluno.tgz /home/backup/aluno.tgz",
 		creates => '/var/gatilho_tar_2',
  }

  file { 'copia_orig_tgz':
 		path => '/home/backup/original_aluno.tgz',
 		ensure => file,
 		source => 'puppet:///modules/atualiza_mac/aluno.tgz',
 		owner => root,
 		group => root,
 		mode => 0644,
  }



}
