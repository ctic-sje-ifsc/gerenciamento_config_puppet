class pycharm {

archive { '/tmp/pycharm.tar.gz':
  ensure        => present,
  extract       => true,
  extract_command => 'tar xfz %s',
  extract_path  => '/opt',
  source        => 'https://discovirtual.ifsc.edu.br/index.php/s/y5VIMVhNtUuLNIp/download',
  creates       => '/opt/pycharm/bin',
  cleanup       => true,
  user			=> aluno,
  group			=> aluno,
  require		=> File['/opt/pycharm'],
}

file { 'pycharm.desktop':
  path => '/usr/share/applications/pycharm.desktop',
  ensure => file,
  source => 'puppet:///modules/pycharm/pycharm.desktop',
  owner => root,
  group => root,
  mode => 0644,
}

file { '/opt/pycharm':
  path => '/opt/pycharm',
  ensure => directory,
  owner => aluno,
  group => aluno,
  mode => 0755,
}


}
