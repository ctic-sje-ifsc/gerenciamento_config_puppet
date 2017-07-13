#05_administrativo_win.pp

########################## Almoxarifado Tele
 node /sj-almtele/ {
	 include sistema_win
	 include ntp
 }
 ########################## Audio Visual
 node /^sj-audvis-/ {
   include sistema_win
   include ntp
   include ingressa_ldap
 }
 ########################## Secretaria
 node /^sj-secre-/ {
 	include sistema_win
 	include ntp
 	include ingressa_ldap
 }
########################## Lab Fisica
node /^sj-fis-/ {
	include sistema_win
	include ntp
	include ingressa_ldap
}
########################## Depe
node /^sj-depe-/ {
	include sistema_win
	include ntp
	include ingressa_ldap
}
########################## Lab Quimica
node /^sj-quim-/ {
  include sistema_win
	include ntp
	include ingressa_ldap
}
########################## Lab Biologia
node /^sj-bio-/ {
	include sistema_win
	include ntp
	include ingressa_ldap
}
########################## Desenvolvimento 1
node /^sj-des1-/ {
	#include sistema_win_labs
	include sistema_win
	include ntp
	include ingressa_ldap
}
########################## Desenvolvimento 2
node /^sj-des2-/ {
	include sistema_win
	include ntp
  include ingressa_ldap
}
########################## Meio de Telecomunicacoes
node /^sj-mtele-/ {
	include sistema_win
	include ntp
	include ingressa_ldap
    include ltspice
    #pedido do Volney
    package { 'inkscape':
      ensure   => latest,
      install_options => ['-y', '--allow-empty-checksums'],
      provider => 'chocolatey',
    }
}
########################## Manutencao
node /^sj-manut-/ {
  include ingressa_ldap
	include sistema_win
	include ntp
}
########################## Turno
node /^sj-cotur-/ {
  include ingressa_ldap
	include sistema_win
	include ntp
}
########################## GEDEN
node /^sj-geden-[1-9]/{
	include sistema_win
	include ingressa_ldap
	include ntp
}
########################## Registro
node /^sj-reg/{
	include sistema_win
	include ntp
	include ingressa_ldap
}
node /sj-regis/{
	include sistema_win
	include ntp
}
########################## DAM
node /^sj-dam-/{
  include ingressa_ldap
	include sistema_win
	include ntp
}
########################## Suporte Educacional
node /sj-suped/{
	include sistema_win
	include ntp
	include ingressa_ldap
}
########################## CTIC
node "sj-ctic-36811.sj.ifsc.edu.br" {
	include sistema_win
	include ntp
}
node /sj-ctic/ {
 include sistema_win
 include ingressa_ldap
 include ntp
}
########################## Direcao
 node /sj-dire/ {
	include sistema_win
 	include ingressa_ldap
 	include ntp
 }
 ########################## Biblioteca
 node /sj-biblio/ {
	 include sistema_win
	 include ntp
	 include ingressa_ldap
	 include sophia
 }
########################## Educacao Fisica
 node /sj-edfis/ {
	 include sistema_win
	 include ingressa_ldap
	 include ntp
 }
########################## Almoxarifado
 node /sj-almox/ {
	 include sistema_win
	 include ntp
	 include banco
	 include ingressa_ldap
 }
########################## Meios RAC
node /^sj-merac-/ {
	include sistema_win
	include ntp
}
########################## Coordenacao RAC
node /^sj-corac-/ {
	include sistema_win
  include ingressa_ldap
  include ntp
}
########################## Coordenacao GERAC
node /^sj-gerac-/ {
  include sistema_win
  include ingressa_ldap
  include ntp
}
########################## Meios Cultura Geral
node /^sj-mcul-/ {
	include sistema_win
	include ingressa_ldap
	include ntp
}
########################## Pesquisa e extensao
node /sj-cere/ {
  include ingressa_ldap
	include sistema_win
	include ntp
}
########################## Coord TELE
node /sj-cotel/ {
	include sistema_win_labs
	include ntp
	include ingressa_ldap
}

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
}

########################## Mini auditorio
node /^sj-maud/ {
  include sistema_win
	include ntp
}

########################## Auditorio
node /^sj-aud/ {
  include sistema_win
	include ntp
  include ingressa_ldap
}

########################## Video Conferencia
node /^sj-vconf/ {
  include sistema_win
	include ntp
}

########################## Default
node "sj-imagem-54321.sj.ifsc.edu.br" {
	include sistema_win
}
########################## Default
node "sj-imgwin-12345.sj.ifsc.edu.br" {
	include sistema_win
	include ntp
}

########################## Financeiro e COMAF
node /^sj-comaf/ {
	include sistema_win
	include ingressa_ldap
	include ntp
}
########################## COGER
node /^sj-coger/ {
	include sistema_win
	include ingressa_ldap
	include ntp
}
########################## CGP
node /^sj-cgp/ {
	include sistema_win
	include ingressa_ldap
	include ntp
}
node /sj-pat/ {
	include sistema_win
	include ingressa_ldap
	include ntp
	include banco
}
node /^sj-saude-/ {
	include sistema_win
	include ntp
	include ingressa_ldap
  include banco
}
node /^sj-alrac-/ {
	include sistema_win
	include ingressa_ldap
	include ntp
}

node /^sj-img_win7/ {
  include sistema_win
  include ntp
  include banco
}

########################## Backup ADM
node /^sj-adbkp-/ {
	include sistema_win
	include ntp
	include ingressa_ldap
}
