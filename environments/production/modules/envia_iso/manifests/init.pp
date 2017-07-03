class envia_iso {

##serve para enviar alguma imagem para algum lab, copia da maquina do ricardo
##nao usar a qualquer momento. Incluir o modulo e ir no laboratorio ligas as maquinas.

	exec { 'ubuntu_mate':
		command => '/bin/mount -t nfs 172.18.20.200:/dados/ /mnt ; /bin/cp /mnt/Imagens_ISOs/Ubuntu/ubuntu-mate-14.04.2-LTS-desktop-amd64.iso /home/imagens',
		creates => '/home/imagens/ubuntu-mate-14.04.2-LTS-desktop-amd64.iso',
		timeout => 0,
	}
	exec { 'windows_ova':
		command => '/bin/mount -t nfs 172.18.20.200:/dados/ /mnt ; /bin/cp /mnt/OVA/Windows-7.ova /home/imagens',
		creates => '/home/imagens/Windows-7.ova',
		timeout => 0,
	}

}
