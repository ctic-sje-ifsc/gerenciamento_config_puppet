class final_semestre {

## Deve-se realizar esse procedimento em todo final de semestre.
## Toda a virada de semestre deve-se alterar, no final da linha command, o numero 1 para 2 e vice-versa.
## O creates dos 2 execs deve ser alterado do mesmo modo.

	exec { 'zerar_vm':
		command => '/bin/tar -jxvf /home/backup/1-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/2-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/3-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/4-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/5-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/6-Grafico.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/1-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/2-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/3-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/4-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/5-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/6-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/7-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/8-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/9-Servidor.bz -C / 2>> /final_semestre.log; /bin/tar -jxvf /home/backup/10-Servidor.bz -C / 2>> /final_semestre.log; /bin/touch /var/gatilho_zerar_vm_2; /bin/rm /var/gatilho_zerar_vm_1; /bin/rm /var/gatilho_vm; /bin/rm /var/gatilho_tar;/bin/rm /var/gatilho_zarar_vm_2',
		timeout => 0,
		creates => '/var/gatilho_zerar_vm_2',
	}
	exec { 'limpar_pasta':
		command => '/bin/rm -rf /media/aluno/trabalhos/* 2>> /final_semestre.log; /bin/touch /var/gatilho_zera_pasta_2; /bin/rm /var/gatilho_zera_pasta1; /bin/rm /var/gatilho_zera_pasta',
		creates => '/var/gatilho_zera_pasta_2',
		timeout => 0,
	}
	include atualiza_mac

}
