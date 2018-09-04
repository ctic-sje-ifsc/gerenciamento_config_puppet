#06_laboratorios.pp

########################################## INICIO LAB PROG #############################################

##PROFESSOR

#windows
node "sj-prog-744523.sj.ifsc.edu.br" {
		include sistema_win_labs
		include ingressa_ldap
		include progisp
}

#linux
node /^sj-labprog-744523/ {
	include sistema
	include config_rede_labs
	include grub_lab_lin
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes
	include apagaaluno
	include chave_compartilhada
	include ingressa_ldap
	include netbeans_8_2
	include atualiza_mac
	include foxit
	include ides_jetbrains
	
	file { 'permissao_vmdk':
 		path => '/home/VMDK/',
 		ensure => directory,
 		owner => aluno,
		recurse => true,
 		group => 'Domain Users',
		mode => 0660,
  }

	file { 'configura_monitor':
        path => '/etc/profile.d/configura_monitor.sh',
        ensure => file,
        source => 'puppet:///modules/progpadroeslabs/configura_monitor_labprog.sh',
        owner => root,
        group => root,
        mode => 0777,
    }


}
##

##ALUNOS

#windows
node /^sj-prog/ {
		include sistema_win_labs
		include progisp
		#include packettracer7
}

#Linux
node /^sj-labprog/ {
	include sistema
	include grub_lab_lin #include grub_lab_win
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes-client
	include apagaaluno
	include chave_compartilhada
	include atualiza_mac
	include disable_ipv6
	include netbeans_8_2
	include packettracer7
	include ides_jetbrains
	
	
}
##
########################################## FIM LAB PROG #################################################

########################################## INICIO LAB REDES1 #################################################

##professor
node "sj-redes1-744530.sj.ifsc.edu.br" {
	include sistema
	include config_rede_labs
	include grub_soh_lin
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes
	include chave_compartilhada
	include ingressa_ldap
	include atualiza_mac
	include netbeans_8_2
	include packettracer7
	include tracker
	include ingles_progs

	file { 'permissao_vmdk':
 		path => '/home/VMDK/',
 		ensure => directory,
 		owner => aluno,
		recurse => true,
 		group => 'Domain Users',
		mode => 0660,
  }
  file { 'configura_monitor':
	  path => '/etc/profile.d/configura_monitor.sh',
	  ensure => file,
	  source => 'puppet:///modules/progpadroeslabs/configura_monitor_redes1.sh',
	  owner => root,
      group => root,
	  mode => 0777,

  }
}

##ALUNOS
##node /^sj-redes1-[d-e][2-9]/ {
node /^sj-redes1/ {
	include sistema
	include grub_soh_lin #include grub_lab_win
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes-client
	include apagaaluno
	include chave_compartilhada
	include atualiza_mac
	include disable_ipv6
	include netbeans_8_2
	include packettracer7
	include ingles_progs

}

##
########################################## FIM LAB REDES1 #################################################
#

##

########################################## INICIO DO REDES2 #################################################

#windons professor
node "sj-red2-703872.sj.ifsc.edu.br" {
	include sistema_win_labs
	include ingressa_ldap
}

#linux prof
node "sj-lin-redes2-703872.sj.ifsc.edu.br" {
	include sistema
	include config_rede_labs
	include grub_lab_lin
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes
	include chave_compartilhada
	include ingressa_ldap
	include netbeans_8_2
	include packettracer7
	include android_studio3
	include foxit
	include ides_jetbrains
	include ingles_progs

	
	
	##include atualiza_mac

	file { 'permissao_vmdk':
 		path => '/home/VMDK/',
 		ensure => directory,
 		owner => aluno,
		recurse => true,
 		group => 'Domain Users',
		mode => 0660,
  	}
	file { 'configura_monitor':
 		path => '/etc/profile.d/configura_monitor.sh',
 		ensure => file,
		source => 'puppet:///modules/progpadroeslabs/configura_monitor_redes2.sh',
		owner => root,
   	 	group => root,
		mode => 0777,
  	}
}

#windons aluno
node /^sj-red2/ {
	include sistema_win_labs
}

#linux aluno
node /^sj-labredes2/ {
	include sistema
	include grub_lab_lin
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes-client
	include apagaaluno
	include chave_compartilhada
	include disable_ipv6
	include netbeans_8_2
	include packettracer7
	include android_studio3
	include ides_jetbrains
	include ingles_progs

	
	
  ##include atualiza_mac

}
########################################## FIM REDES2 #################################################


########################################## LAB BKP #####################################################

#### PROFESSOR
#linux
node "sj-lab-bkp-744521.sj.ifsc.edu.br" {
	include sistema
	include grub_lab_win
	include progpadroeslabs
	include sshd_config
	include config_rede_labs
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes
	include apagaaluno
	include chave_compartilhada
	include ingressa_ldap
	#include atualiza_mac
	file { 'permissao_vmdk':
 		path => '/home/VMDK/',
 		ensure => directory,
 		owner => aluno,
		recurse => true,
 		group => 'Domain Users',
		mode => 0660,
  }

}
#windows
node "sj-bkp-744521.sj.ifsc.edu.br" {
	include sistema_win_labs
	include sr2015
	include ingressa_ldap
}

##ALUNOS

#windows
node /^sj-bkp/ {
		include sistema_win_labs
}

#Linux
node /^sj-lab-bkp/ {
	include sistema
	include grub_lab_lin #include grub_lab_win
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes-client
	include apagaaluno
	include chave_compartilhada
	#include atualiza_mac
	include disable_ipv6
	include netbeans_8_2
}



########################################## FIM LAB BKP #################################################




########################################## LAB CAD 1 2 E 3 #################################################

## CAD 1, 2 E 3 - WINDOWS PROFESSOR

node "sj-cad1-37247.sj.ifsc.edu.br" {
	include sistema_win_labs
	include sr2015
	include ingressa_ldap
	include sketchup
}

node "sj-cad2-38841.sj.ifsc.edu.br" {
	include sistema_win_labs
	include sr2015
	include ingressa_ldap
	include sketchup
}

node "sj-cad3-744528.sj.ifsc.edu.br" {
	include sistema_win_labs
	include sr2015
	include ingressa_ldap
	include sketchup
	include bricscad
	include progisp
}

## CAD 1, 2 E 3 - WINDOWS ALUNO

node /^sj-cad3/ {
	include sistema_win_labs
	include sr2015
	include sketchup
	include bricscad
	include progisp
}

node /^sj-cad/ {
	include sistema_win_labs
	include sr2015
	include sketchup
}
##

##CAD1 PROFESSOR LINUX
node "sj-labcad1-37247.sj.ifsc.edu.br" {
	include sistema
	include grub_lab_win #include grub_lab_win
	include progpadroeslabs
	include sshd_config
	include config_rede_labs
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes
	include apagaaluno
	include chave_compartilhada
	include ingressa_ldap
	#include envia_iso
	#include atualiza_mac
	include ingles_progs

	file { 'permissao_vmdk':
 		path => '/home/VMDK/',
 		ensure => directory,
 		owner => aluno,
		recurse => true,
 		group => 'Domain Users',
		mode => 0660,
  }

}
##

##CAD3 PROFESSOR LINUX
node "sj-lin-cad3-744528.sj.ifsc.edu.br" {
	include sistema
	include grub_lab_win #include grub_lab_win
	include progpadroeslabs
	include sshd_config
	include config_rede_labs
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes
	include chave_compartilhada
	include ingressa_ldap
	include quadro_interativo
	#include atualiza_mac
	include ingles_progs

	file { 'permissao_vmdk':
 		path => '/home/VMDK/',
 		ensure => directory,
 		owner => aluno,
		recurse => true,
 		group => 'Domain Users',
		mode => 0660,
  }
}

##

##CAD2 PROFESSOR LINUX
node "sj-labcad2-38841.sj.ifsc.edu.br" {
	include sistema
	include grub_lab_win #include grub_lab_win
	include progpadroeslabs
	include sshd_config
	include config_rede_labs
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes
	include apagaaluno
	include chave_compartilhada
	include ingressa_ldap
	#include atualiza_mac
	include ingles_progs

	file { 'permissao_vmdk':
 		path => '/home/VMDK/',
 		ensure => directory,
 		owner => aluno,
		recurse => true,
 		group => 'Domain Users',
		mode => 0660,
  }

}
##

## CAD1,2 E 3 ALUNOS linux

node /^sj-labcad/ {
	include sistema
	include grub_lab_win #include grub_lab_win
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes-client
	include apagaaluno
	include chave_compartilhada
	#include envia_iso
	#include atualiza_mac
	include disable_ipv6
	include ingles_progs
}

##
########################################## FIM LAB CAD 1 2 E 3 #################################################

########################################## INICIO BILIOTECA #################################################
#PC alunos biblioteca LINUX
node /^sj-lin-labbiblio-/ {
	include grub_lab_lin
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include apagaaluno

}
##PC ALUNO BIBLIOTECA WINDOWS
node /^sj-labbib-/ {
  include sistema_win_labs
}

########################################## FIM BIBLIOTECA #################################################

########################################## INICIO COMUNICACAO E EXPRESSAO #################################################
## FEITO DIA 24/03/2016
	#win
	node /^sj-comex/ {
		include sistema_win
		include ingressa_ldap
	}
	#linux
	node /^sj-lin-comex/ {
		include progsadm
	  include ingressa_ldap
	  include ntp
	  include rclocal_adm
	  include grub_lab_win
		include quadro_interativo
		include qgis
	}


	########################################## FIM COMUNICACAO E EXPRESSAO #################################################

	########################################## INICIO LABALUNOS LTSP #################################################
	node "sj-lin-labalu-serv-37248.sj.ifsc.edu.br" {
		include grub_soh_lin
		include progpadroeslabs
		include arduino_1_6_6
		include netkit2
		include eclipsemodificado
		include rclocal
		include ntp
		include ltsp_fat_client
		include apagaaluno_ltsp
		include atalhos_e_icones
		include netbeans_8_2
		include tracker
	}
	########################################## FIM LABALUNOS #################################################

	########################################## INICIO INTERATIVO LTSP #################################################
	node "sj-lin-labint-serv-38318.sj.ifsc.edu.br" {
		include grub_soh_lin
		include progpadroeslabs
		include arduino_1_6_6
		include netkit2
		include ingressa_ldap
		include eclipsemodificado
		include rclocal
		include ntp
		include ltsp_fat_client
		include apagaaluno_ltsp
		include quadro_interativo
		include atalhos_e_icones
		include cmap_tools
		include netbeans_8_2
	}
	########################################## FIM INTERATIVO #################################################

########################################## INICIO LAB VOZ E IMAGEM #############################################


#Lab voz e imagem - linux
node /^sj-lin-labvoz/ {
	include grub_soh_lin
	include progpadroeslabs
	include sshd_config
	include sudoers
	include ingressa_ldap
	include senhaaluno
	include rclocal
#   include apagaaluno
	include chave_compartilhada
}
#Lab voz e imagem - windows
node /^sj-labvo/ {
	include sistema_win
	#include ingressa_ldap
}

########################################## FIM LAB VOZ E IMAGEM #################################################

########################################## INICIO LAB APLICADA #################################################

#Lab aplicada - linux
node /^sj-lin-aplicada/ {
	include grub_soh_lin
	include progpadroeslabs
	include sshd_config
	include sudoers
	include ingressa_ldap
	include senhaaluno
	include rclocal
#   include apagaaluno
	include chave_compartilhada
}
#Lab aplicada - windows
node /^sj-aplica/ {
	include sistema_win
	include ingressa_ldap
	include multisimdemo
}

########################################## FIM LAB APLICADA #####################################################

########################################## INICIO CIENCIAS HUMANDAS ##############################################

#Lab Ciencias Humanas
	#win
	node /^sj-ciehu/ {
		include ntp
		include sistema_win
		include ingressa_ldap
	}
	#linux
	node /^sj-lin-ciehu/ {
		include progsadm
		include ingressa_ldap
		include ntp
		include rclocal_adm
		include grub_lab_win
		include qgis
	}

########################################## FIM LAB APLICADA #####################################################

########################################## INICIO LAB MEIOS DE TRANSMISSAO #########################################

#Lab Meios de transmissao
#Linux
node /^sj-labmeios/{
     include grub_lab_lin
     include progpadroeslabs
     include sshd_config
     include sudoers
     include ingressa_ldap
     include senhaaluno
     include rclocal
     include chave_compartilhada

 	 file { 'configura_monitor':
       path => '/etc/profile.d/configura_monitor.sh',
       ensure => file,
       source => 'puppet:///modules/progpadroeslabs/configura_monitor_meios.sh',
       owner => root,
       group => root,
       mode => 0777,

     }
}

#Windows
node /^sj-meios/{
		include sistema_win_labs
		include ingressa_ldap
}

########################################## FIM LAB MEIOS DE TRANSMISSAO #########################################

########################################## INICIO LAB CAMARA DE TESTE #########################################

#Lab Camera de teste
  #Windows
node /^sj-latest/ {
	include sistema_win_labs
	include sr2015
}
  #Linux
node /^sj-lin-labtest/ {
	include sistema
	include grub_adm_win
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include epoptes-client
	include apagaaluno
	include chave_compartilhada
	#include envia_iso
	#include atualiza_mac
	include disable_ipv6
}

########################################## FIM LAB CAMARA DE TESTE #########################################
