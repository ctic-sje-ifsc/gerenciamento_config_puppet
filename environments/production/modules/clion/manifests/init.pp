class clion {

archive { '/tmp/clion.tar.gz':
  ensure        => present,
  extract       => true,
  extract_command => 'tar xfz %s',
  extract_path  => '/opt',
  source        => 'https://discovirtual.ifsc.edu.br/index.php/s/GRMozf4RHdkFX5b/download',
  creates       => '/opt/clion/bin',
  cleanup       => true,
  user			=> aluno,
  group			=> aluno,
  require		=> File['/opt/clion'],
}

file { 'clion.desktop':
  path => '/usr/share/applications/clion.desktop',
  ensure => file,
  source => 'puppet:///modules/clion/clion.desktop',
  owner => root,
  group => root,
  mode => 0644,
}

#file { 'accepted':
#  path => '/opt/clion/accepted',
#  ensure => file,
#  source => 'puppet:///modules/clion/accepted',
#  owner => aluno,
#  group => aluno,
#  mode => 0644,
#}
#
#file { 'jetbrains.tar.gz':
#  path => '/opt/clion/jetbrains.tar.gz',
#  ensure => file,
#  source => 'puppet:///modules/clion/jetbrains.tar.gz',
#  owner => aluno,
#  group => aluno,
#  mode => 0644,
#}

file { '/opt/clion':
  path => '/opt/clion',
  ensure => directory,
  owner => aluno,
  group => aluno,
  mode => 0755,
}


}
