class quartus_gravacao {

#Esse modulo altera os arquivos abaixo de /bin/sh para /bin/bash

	file { 'sof2flash':
		path => '/opt/altera/13.0sp1/nios2eds/bin/sof2flash',
		ensure => file,
		source => 'puppet:///modules/quartus_gravacao/sof2flash',
		owner => root,
		group => root,
		mode => 0755,
	}

  file { 'sh_jar.sh':
		path => '/opt/altera/13.0sp1/nios2eds/bin/sh_jar.sh',
		ensure => file,
		source => 'puppet:///modules/quartus_gravacao/sh_jar.sh',
		owner => root,
		group => root,
		mode => 0755,
	}

  file { 'elf2flash':
		path => '/opt/altera/13.0sp1/nios2eds/bin/elf2flash',
		ensure => file,
		source => 'puppet:///modules/quartus_gravacao/elf2flash',
		owner => root,
		group => root,
		mode => 0755,
	}

}
