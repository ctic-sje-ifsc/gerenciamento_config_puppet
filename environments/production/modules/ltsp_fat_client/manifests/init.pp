class ltsp_fat_client {

###PACOTES NECESSARIOS

  package { 'ltsp-server-standalone':
		ensure => latest,
	}
  package { 'isc-dhcp-server':
		ensure => latest,
	}
  package { 'ifenslave':
		ensure => latest,
	}
  package { 'epoptes':
		ensure => latest,
	}
  package { 'mate-desktop-environment-core':
		ensure => latest,
    }

###FIM DOS PACOTES NECESSARIOS

###SERVICOS RODANDO
  service { 'isc-dhcp-server':
    ensure => running,
    enable => true,
    subscribe => [
      File['isc-dhcp-server'],
      File['dhcpd.conf2'],
      File['dhcpd.conf'],
    ],
    require => Package['isc-dhcp-server'],
  }
###FIM DOS SERVICOS RODANDO

#### CONFIGURACOES DE REDE

  file {'interfaces':
    path => '/etc/network/interfaces',
    ensure => file,
    source => 'puppet:///modules/ltsp_fat_client/interfaces',
    owner => root,
    group => root,
    mode => 0644,
  }

  file {'bonding.conf':
    path => '/etc/modprobe.d/bonding.conf',
    ensure => file,
    source => 'puppet:///modules/ltsp_fat_client/bonding.conf',
    owner => root,
    group => root,
    mode => 0644,
    require => Package['ifenslave'],
  }

  file {'modules':
    path => '/etc/modules',
    ensure => file,
    source => 'puppet:///modules/ltsp_fat_client/modules',
    owner => root,
    group => root,
    mode => 0644,
    require => Package['ifenslave'],
  }

  ##CONFIGURA O ENCAMINHAMENTO
  file { 'sysctl.conf':
      path => '/etc/sysctl.conf',
      ensure => file,
      source => 'puppet:///modules/ltsp_fat_client/sysctl.conf',
      owner => root,
      group => root,
      mode => 0644,
  }
  exec { 'sysctl':
      command => "/sbin/sysctl -p /etc/sysctl.conf",
      subscribe => File ['sysctl.conf'],
      refreshonly => true,
  }
  exec { 'restart.procps':
    command => "/etc/init.d/procps restart",
    subscribe => File ['sysctl.conf'],
    refreshonly => true,
  }

  file {'ip_forward':
    path => '/proc/sys/net/ipv4/ip_forward',
    ensure => file,
    source => 'puppet:///modules/ltsp_fat_client/ip_forward',
    owner => root,
    group => root,
    mode => 0644,
  }

  file {'nat':
    path => '/etc/ltsp/nat',
    ensure => file,
    source => 'puppet:///modules/ltsp_fat_client/nat',
    owner => root,
    group => root,
    mode => 0644,
  }

  # FIM DO CONFIGURA O ENCAMINHAMENTO
#### FIM DAS CONFIGURACOES DE REDE

###ARQUIVOS DE CONF NECESSARIOS

  file { 'dhcpd.conf':
		path => '/etc/ltsp/dhcpd.conf',
		ensure => file,
		source => 'puppet:///modules/ltsp_fat_client/dhcpd.conf',
		owner => root,
		group => root,
		mode => 0644,
    require => Package['ltsp-server-standalone'],
	}

  file { 'isc-dhcp-server':
    path => '/etc/default/isc-dhcp-server',
    ensure => file,
    source => 'puppet:///modules/ltsp_fat_client/isc-dhcp-server',
    owner => root,
    group => root,
    mode => 0644,
    require => Package['isc-dhcp-server'],
  }

  file {'exports':
    path => '/etc/exports',
    ensure => file,
    source => 'puppet:///modules/ltsp_fat_client/exports',
    owner => root,
    group => root,
    mode => 0644,
    require => Package['ltsp-server-standalone'],
  }

  file {'ltsp-build-client.conf':
    path => '/etc/ltsp/ltsp-build-client.conf',
    ensure => file,
    source => 'puppet:///modules/ltsp_fat_client/ltsp-build-client.conf',
    owner => root,
    group => root,
    mode => 0644,
    require => Package['ltsp-server-standalone'],
  }

  file {'dhcpd.conf2':
    path => '/etc/dhcp/dhcpd.conf',
    ensure => present,
    require => Package['isc-dhcp-server'],
  }

###FIM DOS ARQUIVOS DE CONF NECESSARIOS

###EXECS NECESSARIOS
    exec { 'gatilho_dhcp':
   		command => "/bin/echo 'include \"/etc/ltsp/dhcpd.conf\";' >> /etc/dhcp/dhcpd.conf ; /bin/touch /var/gatilho_dhcp",
   		timeout => 0,
   		creates => '/var/gatilho_dhcp',
      require => [
          Package['isc-dhcp-server'],
          Package['ltsp-server-standalone'],
      ],
      subscribe => File['dhcpd.conf2'],
    }
###FIM DOS EXECS NECESSARIOS

### CONSTRUCAO DA IMAGEM

  file {'lts.conf':
    path => '/srv/tftp/ltsp/i386/lts.conf',
    ensure => file,
    source => 'puppet:///modules/ltsp_fat_client/lts.conf',
    owner => root,
    group => root,
    mode => 0644,
    require => Exec['ltsp-build-client'],
  }

  exec { 'ltsp-build-client':
    command => '/usr/sbin/ltsp-build-client',
    # so executa senao tiver o arquivo abaixo
    creates => '/opt/ltsp/i386',
    timeout => 0,
    require => Package['ltsp-server-standalone'],
  }

###FIM DA CONSTRUCAO DA IMAGEM

###INICIO DOS USUARIOS

/*exec { 'add_epoptes':
  command => '/usr/bin/gpasswd -a bolsista epoptes ; /usr/bin/gpasswd -a ctic epoptes ; /bin/touch /var/gatilho_add_epoptes',
  require => [
      Package['epoptes'],
      User['bolsista'],
  ],
  creates => '/var/gatilho_add_epoptes',
}*/


  user { 'bolsista':
    ensure     => 'present',
    managehome => true,
    password   => '$6$gzfvLUvj$K7XXYBboLDQcn55yh6nSbI0WjlSbz9ETC.sP75VACd7QU1XcsnI1pGjQvJKxAc6ygC82AiskgNwSj50pN8hsY1',
    shell => '/bin/bash',
  }
  user { 'aluno1':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno2':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno3':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno4':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno5':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno6':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno7':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno8':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno9':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno10':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno11':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno12':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno13':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno14':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno15':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno16':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno17':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno18':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno19':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno20':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno21':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno22':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno23':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno24':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno25':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno26':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno27':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno28':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno29':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno30':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }
  user { 'aluno31':
    ensure     => 'present',
    managehome => true,
    password   => '$6$ZXaEonzS$4C1xRukHjU4rtB42asX5N3qZjnKE5lve3GyLfHZkmRR7ZRkdSfmOgstLVwDiD82jkAHuX/gToQy5IaFjeXm3E.',
    shell => '/bin/bash',
  }

###FIM DOS USUARIOS

}
