#04_administrativo_linux.pp

####
### Computadores administraivos
####

####FEITOS DIA 05/02/2016
########################## Manutencao
node /^sj-lin-manut/ {
	include progsadm
	#include ingressa_ldap
	include rclocal_adm
	include grub_lab_lin
	include dhcp_auto
}
########################## Laboratorio de prototipagem
node /^sj-lin-labprot/ {
	include progsadm
	include rclocal_adm
	include dhcp_auto
}
########################## Educacao Fisica
node /^sj-lin-edfis/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include remoto_sapafjovem
	include remoto_sapafadulto
	include openjdk-7u111
	include dhcp_auto
}
node /^sj-lin-note-edifis/ {
	include progsadm
	include rclocal_adm
	include remoto_sapafjovem
	include remoto_sapafadulto
	include openjdk-7u111
}

########################## Biologia
node /^sj-lin-bio/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include openjdk-7u111
	include dhcp_auto
}
########################## Pesquisa e extensao
node /^sj-lin-dire-37245/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_adm_win
	include openjdk-7u111
	include dhcp_auto
	###OBS modificado apenas o grub###
}

node /^sj-lin-cere/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
	include openjdk-7u111
}
########################## Audio Visual
node /^sj-lin-audvis/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
	include openjdk-7u111
	include dhcp_auto
}
# mudar nome
node "sj-pesq-29734.sj.ifsc.edu.br" {
	include progsadm
	include openjdk-7u111
}

########################## Direcao
node /sj-lin-dire/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include cmap_tools
	include grub_lab_lin
	include imp_padrao
	include openjdk-7u111
	include dhcp_auto
}
########################## Biblioteca
node /sj-lin-biblio/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
	include epoptes
	include remoto_sophia
}

node /sj-lin-bal-biblio/ {
	include progsadm
	include rclocal_adm
	include grub_soh_lin
#	include sophia
    include remoto_sophia
	include java_oracle
	include cupsd
}

########################## Computador reprografia
node /sj-lin-repro/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
	include openjdk-7u111
	include dhcp_auto
}

########################## Desenvolvimento 1
node /^sj-lin-des1/ {
#	include progsadm
	include ingressa_ldap
	include rclocal
	include netkit2
	include progpadroeslabs
	include sshd_config
	include atalhos_e_icones
	include arduino_1_6_6
	include x11vnc
	include dropbox
	include openjdk-7u111
	include dhcp_auto
}
########################## Desenvolvimento 2
node /^sj-lin-des2/ {
#	include progsadm
	include ingressa_ldap
	include rclocal
  	include netkit2
  	include progpadroeslabs
  	include sshd_config
  	include atalhos_e_icones
	include dropbox
	include arduino_1_6_6
	include grub_save
	include x11vnc
	include openjdk-7u111
	include dhcp_auto
}
node "sj-lin-des2-744933.sj.ifsc.edu.br" {
	include sistema
	include progpadroeslabs
	include arduino_1_6_6
	include netkit2
	include eclipsemodificado
	include netbeans_8_2
	include packettracer7
	include dhcp_auto
}
########################## Meios de Telecomunicacoes
node /^sj-lin-mtele/ {
#	include progsadm
	include ingressa_ldap
	include rclocal
	include netkit2
	include progpadroeslabs
	include sshd_config
	include atalhos_e_icones
	package { 'network-manager-pptp-gnome':
		ensure => latest,
	}
	include x11vnc
	include openjdk-7u111
	include grub_save
	include dhcp_auto
}

node "sj-lin-mtele-744527.sj.ifsc.edu.br" {
	include progsadm
	include ingressa_ldap
	include rclocal
	include netkit2
	#include progpadroeslabs
	include sshd_config
	include atalhos_e_icones
	include x11vnc
	package { 'eclipse':
		ensure => latest,
	}
	include openjdk-7u111
	include dhcp_auto
}

########################## Coord TELE
node /sj-lin-cotel/ {
	include sistema
	include grub_lab_lin
	include progpadroeslabs
	include sshd_config
	include arduino_1_6_6
	include netkit2
	include atalhos_e_icones
	include eclipsemodificado
	include rclocal
	include chave_compartilhada
	include ingressa_ldap
	include dhcp_auto
}
node "sj-lin-cotel-38112.sj.ifsc.edu.br" {
	include sistema
	include progpadroeslabs
	include arduino_1_6_6
	include netkit2
	include eclipsemodificado
	include netbeans_8_2
	include packettracer7
	include dhcp_auto
}


#feito dia 19-02-2016
########################## Computadores almoxarifado
node /^sj-lin-almox-/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
	include remoto_sam
	include irpf_lin
	include openjdk-7u111
	include dhcp_auto
}

########################## Computadores almoxarifado de tele
node /^sj-lin-almtele/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_lab_win
	include openjdk-7u111
	exec { 'configura_gnome_classic_default':
		command => '/usr/bin/update-alternatives --install /etc/alternatives/x-session-manager gnome-session-classic /usr/bin/gnome-session-classic 99 ; /usr/bin/touch /var/gatilho_config_default_gnome_classic',
		creates => '/var/gatilho_config_default_gnome_classic',
	}
	include dhcp_auto

}
########################## Suporte Educacional

node /^sj-lin-supedu-/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
	include openjdk-7u111
	include dhcp_auto
}

########################## Turno

node /^sj-lin-cotur/ {
	include progsadm
	if ($hostname =~ /^sj-lin-cotur-38311/) {
		include grub_adm_win
	}else {
		include grub_soh_lin
	}
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include openjdk-7u111
	include dhcp_auto
}


#Funcionando, arrumado dia 22/02/2016
########################## Computador utilizado pela Simone Sell - linux
node "sj-geden-29743.sj.ifsc.edu.br" {
	include progsadm
	include ntp
	include rclocal_adm
	include openjdk-7u111
	include dhcp_auto
}

##########################
node /^sj-lin-geden/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
	include foxit
	include remoto_sapafjovem
	include remoto_sapafadulto
	include openjdk-7u111
	include dhcp_auto
}
########################## Centro academico
node /^sj-cat-/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
	include dhcp_auto
}
########################## Lab. Fisica
node /^sj-lin-fis/ {
	include progsadm
    include ingressa_ldap
    include ntp
    include rclocal_adm
    include grub_lab_lin
	include openjdk-7u111
	include dhcp_auto
}
########################## Lab. Quimica
node /^sj-lin-labquimica/ {
	include progsadm
    include ingressa_ldap
    include ntp
    include rclocal_adm
    include grub_lab_win
	include openjdk-7u111
	include dhcp_auto
}
########################## Meios RAC
node /^sj-lin-meiosrac/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include grub_lab_win
		include openjdk-7u111
		include dhcp_auto
}
########################## Coordenacao RAC
node /^sj-lin-corac/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include grub_adm_win
		include openjdk-7u111
		include dhcp_auto
}
########################## Coordenacao GERAC
node /^sj-lin-gerac/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include grub_adm_win
		include openjdk-7u111
		include dhcp_auto
}
########################## Meios Cultura Geral
node /^sj-lin-mcul/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include grub_lab_lin
		include imp_padrao
		include openjdk-7u111
		include cmap_tools
		include qgis
		include dhcp_auto
}
########################## Mini auditorio
node /^sj-lin-maud/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_lab_win
	include openjdk-7u111
	include dhcp_auto
}
########################## Auditorio
node /^sj-lin-aud/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_adm_win
	include openjdk-7u111
	include dhcp_auto
}
########################## Video Conferencia - Ubuntu Mate
node /^sj-lin-vconf/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_lab_win
	include quadro_interativo
	package { 'kalzium':
	  ensure => latest,
	}
}

########################## Financeiro e COMAF
node /^sj-lin-comaf-38143/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_save
	include openjdk-7u111
	include dhcp_auto
}

node /^sj-lin-comaf/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_soh_lin
	include openjdk-7u111
	include dhcp_auto
}
########################## COGER
node /^sj-lin-coger/ {
 	include progsadm
 	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_lab_lin
	include openjdk-7u111
	include dhcp_auto
}
#########################SECRETaria
node /^sj-lin-secret/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_soh_lin
	include remoto_isaacdesktop
	include remoto_asctime
	include google_chrome
	include openjdk-7u111
	include dhcp_auto
}
########################## CGP
node /^sj-lin-cgp/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include	grub_soh_lin
	#include grub_adm_win
	include remoto_pontosecullum
	include remoto_ibsispes
	include openjdk-7u111
	$list6 = [ "pdftk", "xpdf-utils", "ldap-utils", "swaks"]
	package { $list6:
		ensure => latest,
	}
	include dhcp_auto
	include irpf_lin
}
########################## DAM
node /^sj-lin-dam/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_lab_lin
	include openjdk-7u111
	include dhcp_auto
}

node "sj-lin-reg-humberto.sj.ifsc.edu.br" {
	include openjdk-7u111
	include java_oracle
	include ingressa_ldap
}

#Registro
node /^sj-lin-reg/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_soh_lin
	include remoto_sisaca
	include remoto_isaacdesktop
	include imp_padrao
	include openjdk-7u111
	include dhcp_auto
}

#Patrimonio
node /^sj-lin-pat/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_lab_lin
	include openjdk-7u111
	include dhcp_auto
}

##Setor saude
node /^sj-lin-saude-/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
	include openjdk-7u111
	include dhcp_auto
}

##PC portaria
node /^sj-lin-port-/ {
	include progsadm
	include ntp
	include rclocal_adm
	include grub_soh_lin
	include ingressa_ldap

	exec { 'configura_gnome_classic_default':
		command => '/usr/bin/update-alternatives --install /etc/alternatives/x-session-manager gnome-session-classic /usr/bin/gnome-session-classic 99 ; /usr/bin/touch /var/gatilho_config_default_gnome_classic',
		creates => '/var/gatilho_config_default_gnome_classic',
	}
	include dhcp_auto
}


##Sala Memoria Projeto Mariangela Antigo Xerox
node /^sj-lin-memoria/ {
		include progsadm
		include ingressa_ldap
		include ntp
		include rclocal_adm
		include grub_soh_lin
		include openjdk-7u111
		include dhcp_auto
}

node /^sj-lin-ctic/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include atom
		include ntp
		include packettracer7
		include openjdk-7u111
		include dhcp_auto
}
node /^sj-lin-almoxrac/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_save
	include openjdk-7u111
	include foxit
	include dhcp_auto
}

########################## Transporte
node /^sj-lin-transp/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
	include openjdk-7u111
	include dhcp_auto
}


########################## EmpresaJunior e Hotel Tecnologico
node /^sj-lin-hotel/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
	include dhcp_auto
}

########################## DEPE
node /^sj-lin-depe/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_soh_lin
	include openjdk-7u111
	include dhcp_auto
}

########################## Backup ADM
node /^sj-lin-admbkp/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include grub_lab_lin
		include openjdk-7u111
		include dhcp_auto
}
########################## Representacao estudantil
node /^sj-lin-gremio/ {
	include progsadm
	include rclocal_adm
	include grub_soh_lin
	include openjdk-7u111
	include ntp
	exec { 'configura_gnome_classic_default':
		command => '/usr/bin/update-alternatives --install /etc/alternatives/x-session-manager gnome-session-classic /usr/bin/gnome-session-classic 99 ; /usr/bin/touch /var/gatilho_config_default_gnome_classic',
		creates => '/var/gatilho_config_default_gnome_classic',
	}
	include dhcp_auto
}
node /^sj-lin-calq/ {
	include progsadm
	include rclocal_adm
	include grub_soh_lin
	include openjdk-7u111
	include ntp
	exec { 'configura_gnome_classic_default':
		command => '/usr/bin/update-alternatives --install /etc/alternatives/x-session-manager gnome-session-classic /usr/bin/gnome-session-classic 99 ; /usr/bin/touch /var/gatilho_config_default_gnome_classic',
		creates => '/var/gatilho_config_default_gnome_classic',
	}
	include dhcp_auto
}
