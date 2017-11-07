#06_testes.pp

#Testes
node "ctic-probook-6475b" {

}

node "aluno_virtual" {

}
#maquina virtual Humberto
node "debian-virtual.sj.ifsc.edu.br" {
	#include ingressa_ldap_anterior
	include ingressa_ldap
}
node "sj-imagem-37246.sj.ifsc.edu.br" {
	#include ingressa_ldap_anterior
	#include ingressa_ldap
}
node "server-storage-2" {
	include ingressa_ldap
}



#maquina virtual Ricardo
#node "debian-virtualbox.sj.ifsc.edu.br" {
#	include ingressa_ldap
#	include google_chrome
#}

#node "vrtual-pc.sj.ifsc.edu.br" {
#
#	package { 'jre8':
#	  ensure   => '8.0.66',
#		install_options => ['--allowdowngrade', '-f', '-y'],
#		uninstall_options => ['-a', '-f', '-y', '-x'],
#		provider => 'chocolatey',
#	}
#
#	file {'zabbix_agentd.conf':
#		path => 'C:\ProgramData\zabbix\zabbix_agentd.conf',
#		ensure => file,
#		source => 'puppet:///modules/sistema_win/zabbix_agentd.conf',
#		source_permissions => ignore,
#	}
#
#}
#node "aluno-VirtualBox.sj.ifsc.edu.br" {
#	include sistema
#	include progpadroeslabs
#	include astah
#	include ingressa_ldap
#}

#computador modelo para clonagem maquinas
node "sj-local-123456.sj.ifsc.edu.br" {
	if $::kernel == windows {
		include sistema_win
	}else{
		include progsadm
		include ntp
	}
}

node "sj-humb-455.sj.ifsc.edu.br" {
#   exec { 'install chocolatey':
#       command => "@powershell -NoProfile -ExecutionPolicy Bypass -Command \"iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))\" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin",
#   }
}

node "humberto-pc.sj.ifsc.edu.br" {
# Testes instalacao chocolatey via puppet
#   exec { 'installchocolatey':
#       #command => "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))",
#       command => "cmd.exe /c @powershell -NoProfile -ExecutionPolicy Bypass -Command \"iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))\" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin",
#       path => 'c:\windows\system32',
##      provider => powershell,
#   }

	include sketchup

}

#Testes novos laboratorios
node "sj-imag-win.sj.ifsc.edu.br" {
	include sistema_win_labs
}

node /^sj-img-wubuntu7/ {
	include progsadm
	include rclocal_adm
}

node "sj-imagem-lin.sj.ifsc.edu.br" {
	include sistema
	include grub_lab_lin #include grub_lab_win
	include progpadroeslabs
	include sshd_config
	include sudoers
	include arduino_1_6_6
	include senhaaluno
	include netkit2
	include atalhos_e_icones
	#include eclipsemodificado ; so quando o arliones modificar
	include rclocal
	include epoptes-client
	include apagaaluno
	include netbeans8
}

# Maquina Windows 7 Virtual Box
node "sj-ctic-37246-w.sj.ifsc.edu.br" {
	include ultravnc_win

}

node "sj-virtualctic-37246.sj.ifsc.edu.br" {
	include ingressa_ldap
	include epoptes
#	include progsadm
	package {	'libreofficeatt':
		name => libreoffice,
		install_options =>  '--force-yes',
		ensure => '5.0.5',
	}
}

node "sj-debian-virt.sj.ifsc.edu.br" {
	include ingressa_ldap
}

node "pc-sala.sj.ifsc.edu.br" {
	#include sistema_win
	#include proteus
  #include ingressa_ldap
	#include banco
	#include erre
	}
################################## teste do Ricardo
##WINDOWS 32bits
node "vrtual-PC.sj.ifsc.edu.br" {
#		include ingressa_ldap
#		include sair_ldap
#		include irpf_win
#		include winscp5
#		include limpa_windows
#   include progisp
}
##WINDOWS 64bits
node "win7-64-pc.sj.ifsc.edu.br" {
   include ultravnc_win
#   include kdenlive17
}

##DEBIAN 8
node "sj-lin-imgdeb8.sj.ifsc.edu.br" {
#		include banco
}
##UBUNTU MATE
node "aluno-VirtualBox.sj.ifsc.edu.br" {
#include octave
#	include cupsd
#	include netbeans_8_2
#	include packettracer7
# include astah
#	include ingressa_ldap_novo
# include android_studio3

}
################################## FIM do teste do Ricardo

node "teste-ltsp" {


}


node "sj-lin-deb-teste.sj.ifsc.edu.br" {
	file { '/usr/bin/nemo':
    ensure => 'link',
    target => '/usr/bin/nautilus',
  }
}
