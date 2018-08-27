class clion {

  # Apaga Clion

  file { '/usr/share/applications/clion.desktop':
    ensure => absent,
  }

  file { '/opt/clion/':
    ensure => absent,
    recurse => true,
    force => true,
  }


# archive { '/tmp/clion.tar.gz':
#   ensure        => present,
#   extract       => true,
#   extract_command => 'tar xfz %s',
#   extract_path  => '/opt',
#   source        => 'https://discovirtual.ifsc.edu.br/index.php/s/GRMozf4RHdkFX5b/download',
#   creates       => '/opt/clion/bin',
#   cleanup       => true,
#   user			=> aluno,
#   group			=> aluno,
#   require		=> File['/opt/clion'],
# }

# file { 'clion.desktop':
#   path => '/usr/share/applications/clion.desktop',
#   ensure => file,
#   source => 'puppet:///modules/clion/clion.desktop',
#   owner => root,
#   group => root,
#   mode => 0644,
# }

# file { '/opt/clion':
#   path => '/opt/clion',
#   ensure => directory,
#   owner => aluno,
#   group => aluno,
#   mode => 0755,
# }

}
