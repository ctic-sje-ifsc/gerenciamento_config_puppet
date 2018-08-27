class idea {

  #APAGA Idea

  file { '/usr/share/applications/idea.desktop':
    ensure => absent,
  }

  file { '/opt/idea':
    ensure => absent,
    recurse => true,
    force => true,
  }



  # archive { '/tmp/idea.tar.gz':
  #   ensure        => present,
  #   extract       => true,
  #   extract_command => 'tar xfz %s',
  #   extract_path  => '/opt',
  #   source        => 'https://discovirtual.ifsc.edu.br/index.php/s/cuHvIHfz0YrKp9e/download',
  #   creates       => '/opt/idea/bin',
  #   cleanup       => true,
  #   user			=> aluno,
  #   group			=> aluno,
  #   require		=> File['/opt/idea'],
  # }

  # file { 'idea.desktop':
  #   path => '/usr/share/applications/idea.desktop',
  #   ensure => file,
  #   source => 'puppet:///modules/idea/idea.desktop',
  #   owner => root,
  #   group => root,
  #   mode => 0644,
  # }

  # file { '/opt/idea':
  #   path => '/opt/idea',
  #   ensure => directory,
  #   owner => aluno,
  #   group => aluno,
  #   mode => 0755,
  # }

  # ##Remover versoes antigas
  
  file { '/usr/share/applications/idea-IC.desktop':
    path => '/usr/share/applications/idea-IC.desktop',
    ensure => absent,
  }

  file { '/usr/share/applications/jetbrains-idea-ce.desktop':
    path => '/usr/share/applications/jetbrains-idea-ce.desktop',
    ensure => absent,
  }

  file { '/opt/Intellij':
    path => '/opt/Intellij',
    ensure => absent,
    recurse => true,
    force => true,

  }

  file { '/opt/ANDROID3/.IdeaIC2017.1':
    path => '/opt/ANDROID3/.IdeaIC2017.1',
    ensure => absent,
    recurse => true,
    force => true,
  }

  file { '/opt/ANDROID3/idea-IC*':
    path => '/opt/ANDROID3/idea-IC*',
    ensure => absent,
    recurse => true,
    force => true,
  }

  # A pedido do Mello chamado IFSC#2018062010000061
  file { '/opt/idea/.Idea*':
    path => '/opt/idea/.Idea*',
    ensure => absent,
    recurse => true,
    force => true,
  }


}
