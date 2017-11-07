class android_studio3 {

  exec { 'android_studio3':
		command => '/bin/mount -t nfs storage1:/mnt/storage/storage/puppet_files /mnt ; /bin/cp -r /mnt/ANDROID3 /opt/',
		creates => '/opt/ANDROID3',
		timeout => 0,
	}
    file { '51-android.rules':
  		path => '/etc/udev/rules.d/51-android.rules',
  		ensure => present,
  		owner => root,
  		group => root,
  		mode => 1777,
  	}
    exec { 'instala_android':
  		command => '/bin/mv /opt/ANDROID3/android-studio.desktop /usr/share/applications/android-studio.desktop; /bin/mv /opt/ANDROID3/idea-IC.desktop /usr/share/applications/idea-IC.desktop; /bin/chmod 644 /usr/share/applications/android-studio.desktop; /bin/chmod 644 /usr/share/applications/idea-IC.desktop; /bin/bash /opt/ANDROID3/permissao.sh',
  		creates => '/usr/share/applications/idea-IC.desktop',
  		timeout => 0,
      require => Exec['android_studio3'],
  	}

    file { '/home/aluno/.IdeaIC2017.1':
  		ensure => link,
      owner => aluno,
      group => aluno,
  		target => '/opt/ANDROID3/.IdeaIC2017.1',
  	}
    file { '/home/aluno/.android':
  		ensure => link,
      owner => aluno,
      group => aluno,
  		target => '/opt/ANDROID3/.android',
  	}
    file { '/home/aluno/.AndroidStudio3.0':
  		ensure => link,
      owner => aluno,
      group => aluno,
  		target => '/opt/ANDROID3/.AndroidStudio3.0',
  	}
#    file { '/home/aluno/.gradle':
#  		ensure => link,
#      owner => aluno,
#      group => aluno,
#  		target => '/opt/ANDROID3/.gradle',
#  	}
}
