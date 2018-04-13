class intellij18 {

  exec { 'intellij18':
		command => '/bin/mount -t nfs storage1:/mnt/storage/storage/puppet_files /mnt ; /bin/cp -r /mnt/Intellij /opt/',
		creates => '/opt/Intellij',
		timeout => 0,
    require => Exec['remove_intellij_antigo'],
	}
  exec { 'instala_intellij18':
  	command => '/bin/mv /opt/Intellij/jetbrains-idea-ce.desktop /usr/share/applications/jetbrains-idea-ce.desktop; /bin/chmod 644 /usr/share/applications/jetbrains-idea-ce.desktop; /bin/bash /opt/Intellij/permissao.sh',
  	creates => '/usr/share/applications/jetbrains-idea-ce.desktop',
  	timeout => 0,
    require => Exec['intellij18'],
  }
  file { '/home/aluno/.IdeaIC2018.1':
  	ensure => link,
    owner => aluno,
    group => aluno,
  	target => '/opt/Intellij/.IdeaIC2018.1',
  }

##Remover versao antiga
  exec { 'remove_intellij_antigo':
    command => '/bin/rm -rf /usr/share/applications/idea-IC.desktop /opt/ANDROID3/.IdeaIC2017.1 /opt/ANDROID3/idea-IC*',
    creates => '/usr/share/applications/jetbrains-idea-ce.desktop',
    timeout => 0,
  }
}
