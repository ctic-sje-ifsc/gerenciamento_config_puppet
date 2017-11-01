class sistema_win {


#Modulo para acesso remoto nas maquinas
include ultravnc_win

package { 'chocolatey':
  ensure   => latest,
  provider => 'chocolatey',
}

package { 'zabbix-agent':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'dropbox':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'googlechrome':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'jre8':
  ensure   => '8.0.101',
install_options => ['--forcex86', '-f', '-y', '--x86', '--allow-empty-checksums'],
#install_options => ['/exclude:64', '-PackageParameters "/exclude:64"', '-f', '-y'],
# uninstall_options => ['-a', '-f', '-y', '-x'],
  provider => 'chocolatey',
}
#package { 'firefox':
#  ensure   => '51.0.1',
#  provider => 'chocolatey',
  #install_options => ['--x86','-y', '--allow-empty-checksums'],
#}
package { 'firefoxesr':
  ensure   => latest,
  provider => 'chocolatey',
  install_options => ['--x86','-y', '--allow-empty-checksums'],
}
package { 'flashplayerplugin':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { '7zip':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'vlc':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
#package { 'libreoffice':
#  ensure   => '5.3.4',
#  install_options => ['-y', '--allow-empty-checksums'],
#  provider => 'chocolatey',
#}
#package { 'libreoffice-help':
#  ensure   => '5.2.0',
#  install_options => ['-y', '--allow-empty-checksums'],
#  provider => 'chocolatey',
#}
package { 'cutepdf':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'adobereader':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'owncloud-client':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}

package { 'microsoftsecurityessentials':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}

file {'zabbix_agentd.conf':
	path => 'C:\ProgramData\zabbix\zabbix_agentd.conf',
	ensure => file,
	source => 'puppet:///modules/sistema_win/zabbix_agentd.conf',
	source_permissions => ignore,
}

file { 'puppet.conf':
  path => 'C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf',
  ensure => file,
  source => 'puppet:///modules/sistema_win/puppet.conf',
  source_permissions => ignore,
}


}
