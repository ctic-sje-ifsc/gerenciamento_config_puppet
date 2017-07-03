class final_semestre {

##Deve-se realizar esse procedimento todo o final do semestre.

	exec { 'zerar_vm':
		command => '/bin/tar -jxvf /home/backup/1-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/2-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/3-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/4-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/5-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/6-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/1-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/2-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/3-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/4-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/5-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/6-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/7-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/8-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/9-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/10-Servidor.bz -C / 2>> /final_semestre.log; /bin/touch /var/gatilho_vm; /bin/rm /var/gatilho_tar',
		timeout => 0,
		creates => '/var/gatilho_vm',
	}
	exec { 'limpar_pasta':
		command => '/bin/rm -rf /media/aluno/trabalhos/* 2>> /final_semestre.log; /bin/touch /var/gatilho_zera_pasta; /bin/rm /var/gatilho_zera_pasta; /bin/touch /var/gatilho_zera_pasta_2',
		creates => '/var/gatilho_zera_pasta_2',
		timeout => 0,
	}

}
