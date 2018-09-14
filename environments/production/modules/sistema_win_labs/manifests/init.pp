class sistema_win_labs {

package { 'chocolatey':
  ensure   => latest,
  provider => 'chocolatey',
}
package { 'zabbix-agent':
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
  install_options => ['--allowdowngrade', '-f', '-y', '--x86', '--allow-empty-checksums'],
  uninstall_options => ['-a', '-f', '-y', '-x'],
  provider => 'chocolatey',
}
package { 'firefox':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
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
package { 'unity':
  ensure   => '2017.3.0',
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'libreoffice':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
#Link quebrado versao 5.2.0
#package { 'libreoffice-help':
#  ensure   => latest,
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
package { 'geogebra':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
#package { 'arduino':
#  ensure   => latest,
#  install_options => ['-y', '--allow-empty-checksums'],
#  provider => 'chocolatey',
#}
#package { 'virtualbox':
#  ensure   => latest,
#  install_options => ['-y', '--allow-empty-checksums'],
#  provider => 'chocolatey',
#}
package { 'italc':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'putty':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'adobeair':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'librecad':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'freecad':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}
package { 'cadconverter':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}

package { 'subtitleworkshop':
  ensure   => latest,
  install_options => ['-y', '--allow-empty-checksums'],
  provider => 'chocolatey',
}

file {'zabbix_agentd.conf':
	path => 'C:\ProgramData\zabbix\zabbix_agentd.conf',
	ensure => file,
	source => 'puppet:///modules/sistema_win_labs/zabbix_agentd.conf',
	source_permissions => ignore,
}
file {'LibreCAD.lnk':
	path => 'C:\Users\Public\Desktop\LibreCAD.lnk',
	ensure => file,
	source => 'puppet:///modules/sistema_win_labs/LibreCAD.lnk',
	source_permissions => ignore,
}
file {'TotalCADConverter.lnk':
	path => 'C:\Users\Public\Desktop\TotalCADConverter.lnk',
	ensure => file,
	source => 'puppet:///modules/sistema_win_labs/TotalCADConverter.lnk',
	source_permissions => ignore,
}

file {'Multisim.lnk':
	path => 'C:\Users\Public\Desktop\Multisim.lnk',
	ensure => file,
	source => 'puppet:///modules/sistema_win_labs/Multisim.lnk',
	source_permissions => ignore,
}

file { 'puppet.conf':
  path => 'C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf',
  ensure => file,
  source => 'puppet:///modules/sistema_win_labs/puppet.conf',
  source_permissions => ignore,
}

file { 'C:\Users\Public\Desktop\Subtitleworkshop.lnk':
  ensure => link,
  owner => Administradores,
  group => Administradores,
  target => 'C:\Program Files (x86)\Subtitle Workshop\SubtitleWorkshop.exe',
  require => package ['subtitleworkshop'],
}

exec { 'muda_permissao_multisim':
      command => '$Acl= Get-Acl "C:\Msmdemo" ; $Ar = New-Object  system.security.accesscontrol.filesystemaccessrule("aluno","FullControl", "ContainerInherit,ObjectInherit", "None","Allow") ; $Acl.SetAccessRule($Ar) ; Set-Acl "C:\Msmdemo" $Acl',
      provider => powershell,
}

############# Includes #############
include limpa_windows
include mmanagal
include auto_desligamento
}
