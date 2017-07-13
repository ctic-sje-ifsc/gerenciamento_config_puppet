class envia_iso_deba {

## Serve para enviar alguma imagem para algum lab, copia da maquina do ricardo.
## Nao usar a qualquer momento. Incluir o modulo e ir no laboratorio ligar as maquinas.

	exec { 'debian':
		command => '/bin/mount -t nfs 172.18.20.200:/dados/ /mnt ; /bin/cp /mnt/Imagens_ISOs/Debian/debian-8.4.0-amd64-kde-CD-1.iso /home/imagens',
		creates => '/home/imagens/debian-8.4.0-amd64-kde-CD-1.iso',
		timeout => 0,
	}
	exec { 'windows_ova':
		command => '/bin/mount -t nfs 172.18.20.200:/dados/ /mnt ; /bin/cp /mnt/OVA/Windows-7.ova /home/imagens',
		creates => '/home/imagens/Windows-7.ova',
		timeout => 0,
	}
	/*exec { 'mint':
		command => '/bin/mount -t nfs 172.18.20.200:/dados/ /mnt ; /bin/cp /mnt/Imagens_ISOs/Debian/debian-8.4.0-amd64-kde-CD-1.iso /home/imagens',
		creates => '/home/imagens/debian-8.4.0-amd64-kde-CD-1.iso',
		timeout => 0,
	}*/

}
