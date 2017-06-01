#04_administrativo_linux.pp

####
### Computadores administraivos
####

####FEITOS DIA 05/02/2016
########################## Manutencao
node /^sj-lin-manut/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_adm_win
}
########################## Laboratorio de prototipagem
node /^sj-lin-labprot/ {
	include progsadm
	include rclocal_adm
}
########################## Educacao Fisica
node /^sj-lin-edfis/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include remoto_sapafjovem
	include remoto_sapafadulto
}
node /^sj-lin-note-edifis/ {
	include progsadm
	include rclocal_adm
	include remoto_sapafjovem
	include remoto_sapafadulto
}

########################## Biologia
node /^sj-lin-bio/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
}
########################## Pesquisa e extensao
node /^sj-lin-dire-37245/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_adm_win
	###OBS modificado apenas o grub###
}

node /^sj-lin-cere/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
}
########################## Audio Visual
node /^sj-lin-audvis/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
}
# mudar nome
node "sj-pesq-29734.sj.ifsc.edu.br" {
	include progsadm
}

########################## Direcao
node /sj-lin-dire/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include cmap_tools
	include grub_lab_lin
	include imp_padrao
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
	include sophia
	include java_oracle
	include cupsd
}

########################## Computador reprografia
node /sj-lin-repro/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
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
}

node "sj-lin-mtele-744527.sj.ifsc.edu.br" {
	include ingressa_ldap
	include rclocal
	include netkit2
	include progpadroeslabs
	include sshd_config
	include atalhos_e_icones
	include x11vnc
	package { 'eclipse':
		ensure => latest,
	}
}

#feito dia 19-02-2016
########################## Computadores almoxarifado
node /^sj-lin-almox/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
	include remoto_sam
	include irpf_lin
}

########################## Computadores almoxarifado de tele
node /^sj-lin-almtele/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_lab_win
}
########################## Suporte Educacional

node /^sj-lin-supedu-/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
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
}


#Funcionando, arrumado dia 22/02/2016
########################## Computador utilizado pela Simone Sell - linux
node "sj-geden-29743.sj.ifsc.edu.br" {
	include progsadm
	include ntp
	include rclocal_adm
}

########################## nova maquina simone 02/03/2016
node /^sj-lin-geden/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
	include foxit
	include remoto_sapafjovem
	include remoto_sapafadulto
}
########################## Centro academico
node /^sj-cat-/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
}
########################## Lab. Fisica
node /^sj-lin-fis/ {
	include progsadm
  include ingressa_ldap
  include ntp
  include rclocal_adm
  include grub_lab_lin
}
########################## Lab. Quimica
node /^sj-lin-labquimica/ {
	include progsadm
  include ingressa_ldap
  include ntp
  include rclocal_adm
  include grub_lab_win
}
########################## Meios RAC
node /^sj-lin-meiosrac/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include grub_lab_win
}
########################## Coordenacao RAC
node /^sj-lin-corac/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include grub_adm_win
}
########################## Coordenacao GERAC
node /^sj-lin-gerac/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include grub_adm_win
}
########################## Meios Cultura Geral
node /^sj-lin-mcul/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include grub_lab_lin
		include imp_padrao
}
########################## Mini auditorio
node /^sj-lin-maud/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_lab_win
}
########################## Auditorio
node /^sj-lin-aud/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_adm_win
}
########################## Video Conferencia
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
node /^sj-lin-comaf/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_soh_lin
}
########################## COGER
node /^sj-lin-coger/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_soh_lin
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
}
########################## CGP
node /^sj-lin-cgp/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_soh_lin
	include remoto_pontosecullum
	include remoto_ibsispes
	$list6 = [ "pdftk", "xpdf-utils", "ldap-utils", "swaks"]
	package { $list6:
		ensure => latest,
	}
}
########################## DAM
node /^sj-lin-dam/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_lab_lin
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
	exec { "install_font_garamond":
		command => "/usr/bin/wget -P /usr/share/fonts/ -A ttf -r -np -nd http://garamond.org/urw/ ; /usr/bin/mkfontdir /usr/share/fonts/; /usr/bin/fc-cache -f ; /usr/bin/touch /var/gatilho_add_font_garamond",
		creates => '/var/gatilho_add_font_garamond';
	}
}

#Patrimonio
node /^sj-lin-pat/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_lab_lin
}

##Setor saude
node /^sj-lin-saude-/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
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
}


##Sala Memoria Projeto Mariangela Antigo Xerox
node /^sj-lin-memoria/ {
		include progsadm
		include ingressa_ldap
		include ntp
		include rclocal_adm
		include grub_soh_lin
}

node /^sj-lin-ctic/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include atom
		include ntp
		include packettracer7
}
node /^sj-lin-almoxrac-/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_lab_win
}

########################## Transporte
node /^sj-lin-transp/ {
	include progsadm
	include ingressa_ldap
	include rclocal_adm
	include grub_soh_lin
}

########################## Telefonista
node /^sj-lin-telef-/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
}

########################## EmpresaJunior e Hotel Tecnologico
node /^sj-lin-hotel/ {
	include progsadm
	include ingressa_ldap
	include ntp
	include rclocal_adm
	include grub_soh_lin
}

########################## DEPE
node /^sj-lin-depe/ {
  include progsadm
	include ingressa_ldap
	include rclocal_adm
	include ntp
	include grub_soh_lin
}

########################## Backup ADM
node /^sj-lin-admbkp/ {
		include progsadm
		include ingressa_ldap
		include rclocal_adm
		include grub_lab_lin
}



########################## Computador Diego e Andre manutencao/engenharia do Campus
node "sj-manut-710813.sj.ifsc.edu.br" {
	if $::kernel == windows {
        include sistema_win
    }else{
        include progsadm
    }
}
