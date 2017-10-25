#Classe para criar os atalhos e icones de aplicativos que foram clonados, por exemplo quartus e matlab
class atalhos_e_icones {


	file { 'quartus13.0sp1.desktop':
		path => '/usr/share/applications/quartus13.0sp1.desktop',
		ensure => file,
		source => 'puppet:///modules/atalhos_e_icones/quartus13.0sp1.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}

	file { 'matlab2012b.desktop':
		path => '/usr/share/applications/matlab2012b.desktop',
		ensure => file,
		source => 'puppet:///modules/atalhos_e_icones/matlab2012b.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'matlab2015a.desktop':
		path => '/usr/share/applications/matlab2015a.desktop',
		ensure => file,
		source => 'puppet:///modules/atalhos_e_icones/matlab2015a.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}
	



#	file { 'bash.bashrc':
#		path => '/etc/bash.bashrc',
#		ensure => file,
#		source => 'puppet:///modules/atalhos_e_icones/bash.bashrc',
#		owner => root,
#		group => root,
#		mode => 0644,
#	}

	##Feito para solucionar um problema no vsim quando chamado pelo quartus, tem que adicionar
	##export LD_LIBRARY_PATH=/opt/altera/13.0sp1/lib32/ no /opt/altera/13.0sp1/quartus/bin/quartus
	##item 'With freetype2 2.5.0.1-1' de https://wiki.archlinux.org/index.php/Altera_Design_Software

	file { 'quartus':
		path => '/opt/altera/13.0sp1/quartus/bin/quartus',
		ensure => file,
		source => 'puppet:///modules/atalhos_e_icones/quartus',
		owner => root,
		group => root,
		mode => 0555,
	}

## Feito para resolver o chamado IFSC#2017062710000273 do Moecke

	file { 'modelsim10.1d.desktop':
		path => '/usr/share/applications/modelsim10.1d.desktop',
		ensure => file,
		source => 'puppet:///modules/atalhos_e_icones/modelsim10.1d.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}

	file { 'modelsim.png':
		path => '/opt/altera/13.0sp1/modelsim_ae/modesim.png',
		ensure => file,
		source => 'puppet:///modules/atalhos_e_icones/modelsim.png',
		owner => root,
		group => root,
		mode => 0644,
	}
	# necessario adicionar export MGLS_LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br e export LD_LIBRARY_PATH=/opt/altera/13.0sp1/lib32 para conseguir criar(fazer funcionar) o atalho
	file { 'vsim':
		path => '/opt/altera/13.0sp1/modelsim_ae/vco',
		ensure => file,
		source => 'puppet:///modules/atalhos_e_icones/vsim',
		owner => root,
		group => root,
		mode => 0555,
	}
	
	file { '/opt/altera/13.0sp1/modelsim_ae/bin/vsim':
		ensure => link,
		target => '../vco',
	}
	

	file { '/usr/bin/vsim':
		ensure => link,
		target => '/opt/altera/13.0sp1/modelsim_ae/bin/vsim',
	}
	file { '/usr/bin/matlab15':
		ensure => link,
		target => '/opt/matlab/R2015a/bin/matlab',
	}
	file { '/usr/bin/matlab12':
		ensure => link,
		target => '/opt/matlab/R2012b/bin/matlab',
	}

#Para solucionar problemas com Ctrl + C Ctrl + v no matlab
	file { 'matlab.prf':
		path => '/home/aluno/.matlab/R2015a/matlab.prf',
		ensure => file,
		source => 'puppet:///modules/atalhos_e_icones/matlab.prf',
		owner => aluno,
		group => aluno,
		mode => 0664,
	}
#Criar um link do salve seus trabalhos aqui no home do aluno
	file { '/home/aluno/trabalhos':
		ensure => link,
		target => '/media/aluno/trabalhos',
		owner => aluno,
		group => aluno,
	}


}
