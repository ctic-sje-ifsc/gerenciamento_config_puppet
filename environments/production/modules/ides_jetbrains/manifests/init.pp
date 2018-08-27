class ides_jetbrains {

  #APAGA anteriores

  include clion
	include pycharm
	include idea


  file { [ '/opt/jetbrains',
         '/opt/jetbrains/apps', ]:
    ensure => directory,
    owner => aluno,
    group => aluno,
    mode => 0755,
  }


  # IDEA-U

  archive { '/tmp/idea.tar.gz':
    ensure        => present,
    extract       => true,
    extract_command => 'tar xfz %s',
    extract_path  => '/opt/jetbrains/apps',
    source        => 'https://discovirtual.ifsc.edu.br/index.php/s/ArffLHA4jEM2H9C/download',
    creates       => '/opt/jetbrains/apps/IDEA-U/ch-0',
    cleanup       => true,
    user			=> aluno,
    group			=> aluno,
    require		=> File['/opt/jetbrains/apps'],
  }

  file { 'jetbrains-idea.desktop':
    path => '/usr/share/applications/jetbrains-idea.desktop',
    ensure => file,
    source => 'puppet:///modules/ides_jetbrains/jetbrains-idea.desktop',
    owner => root,
    group => root,
    mode => 0644,
  }

  #CLion

  archive { '/tmp/clion.tar.gz':
    ensure        => present,
    extract       => true,
    extract_command => 'tar xfz %s',
    extract_path  => '/opt/jetbrains/apps',
    source        => 'https://discovirtual.ifsc.edu.br/index.php/s/2g8H8QCvIm8k83H/download',
    creates       => '/opt/jetbrains/apps/CLion/ch-0',
    cleanup       => true,
    user			=> aluno,
    group			=> aluno,
    require		=> File['/opt/jetbrains/apps'],
  }

  file { 'jetbrains-clion.desktop':
    path => '/usr/share/applications/jetbrains-clion.desktop',
    ensure => file,
    source => 'puppet:///modules/ides_jetbrains/jetbrains-clion.desktop',
    owner => root,
    group => root,
    mode => 0644,
  }

  #PyCharm-P

  archive { '/tmp/pycharm.tar.gz':
    ensure        => present,
    extract       => true,
    extract_command => 'tar xfz %s',
    extract_path  => '/opt/jetbrains/apps',
    source        => 'https://discovirtual.ifsc.edu.br/index.php/s/fvdK55V0kstR6zP/download',
    creates       => '/opt/jetbrains/apps/PyCharm-P/ch-0',
    cleanup       => true,
    user			=> aluno,
    group			=> aluno,
    require		=> File['/opt/jetbrains/apps'],
  }

  file { 'jetbrains-pycharm.desktop':
    path => '/usr/share/applications/jetbrains-pycharm.desktop',
    ensure => file,
    source => 'puppet:///modules/ides_jetbrains/jetbrains-pycharm.desktop',
    owner => root,
    group => root,
    mode => 0644,
  }

  #Toolbox

  archive { '/tmp/toolbox.tar.gz':
    ensure        => present,
    extract       => true,
    extract_command => 'tar xfz %s',
    extract_path  => '/opt/jetbrains/apps',
    source        => 'https://discovirtual.ifsc.edu.br/index.php/s/eIHWd8Q4ov6UCs7/download',
    creates       => '/opt/jetbrains/apps/JetBrains/Toolbox/bin/jetbrains-toolbox',
    cleanup       => true,
    user			=> aluno,
    group			=> aluno,
    require		=> File['/opt/jetbrains/apps'],
  }

  file { 'jetbrains-toolbox.desktop':
    path => '/usr/share/applications/jetbrains-toolbox.desktop',
    ensure => file,
    source => 'puppet:///modules/ides_jetbrains/jetbrains-toolbox.desktop',
    owner => root,
    group => root,
    mode => 0644,
  }

  file { [ '/home/aluno/.local/',
         '/home/aluno/.local/share/', ]:
    ensure => directory,
    owner => aluno,
    group => aluno,
    mode => 0700,
  }

  file { '/home/aluno/.local/share/JetBrains':
  	ensure => link,
    owner => aluno,
    group => aluno,
  	target => '/opt/jetbrains/apps/JetBrains',
    require => archive['/tmp/toolbox.tar.gz'],
  }


}
