class android_studio {
	##INICIO DO astah

  	file { 'android_studio':
  		path => '/opt/ANDROID',
  		ensure => file,
  		source => 'puppet:///modules/android_studio/ANDROID',
  		owner => root,
  		group => root,
  		mode => 1777,
  		recurse => true,
  	}

    exec { 'instala_android':
  		command => '/bin/mv /opt/ANDROID/android-studio.desktop /usr/share/applications/android-studio.desktop; /bin/chmod 644 /usr/share/applications/android-studio.desktop',
  		creates => '/opt/ANDROID',
  		timeout => 0,
      require => File['android_studio'],
  	}
    exec { 'cria_links_android':
      command => '/bin/ln -s /opt/ANDROID/.android /home/aluno; /bin/ln -s /opt/ANDROID/.AndroidStudio2.3 /home/aluno; /bin/ln -s /opt/ANDROID/.gradle /home/aluno',
      creates => '/home/aluno/.android',
      timeout => 0,
      require => File['android_studio'],
    }
}
