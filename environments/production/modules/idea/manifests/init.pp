class idea {

archive { '/tmp/idea.tar.gz':
  ensure        => present,
  extract       => true,
  extract_command => 'tar xfz %s',
  extract_path  => '/opt',
  source        => 'puppet:///modules/idea/idea.tar.gz',
  creates       => '/opt/idea/bin',
  cleanup       => true,
  user			=> aluno,
  group			=> aluno,
  require		=> File['/opt/idea'],
}

file { 'idea.desktop':
  path => '/usr/share/applications/idea.desktop',
  ensure => file,
  source => 'puppet:///modules/idea/idea.desktop',
  owner => root,
  group => root,
  mode => 0644,
}

file { '/opt/idea':
  path => '/opt/idea',
  ensure => directory,
  owner => aluno,
  group => aluno,
  mode => 0755,
}


}
