class android_studio {
	##INICIO DO astah

  exec { 'android_studio':
		command => '/bin/mount -t nfs 191.36.8.93:/dados/ /mnt ; /bin/cp -r /mnt/ANDROID /opt/',
		creates => '/opt/ANDROID',
		timeout => 0,
	}
    	file { '51-android.rules':
  		path => '/etc/udev/rules.d/51-android.rules',
  		ensure => file,
  		source => 'puppet:///modules/android_studio/51-android.rules',
  		owner => root,
  		group => root,
  		mode => 1777,
  	}
    exec { 'instala_android':
  		command => '/bin/mv /opt/ANDROID/android-studio.desktop /usr/share/applications/android-studio.desktop; /bin/chmod 644 /usr/share/applications/android-studio.desktop; /bin/chmod -R 1777 /opt/    ANDROID',
  		creates => '/usr/share/applications/android-studio.desktop',
  		timeout => 0,
      require => Exec['android_studio'],
  	}
    exec { 'cria_links_android':
      command => '/bin/ln -s /opt/ANDROID/.android /home/aluno; /bin/ln -s /opt/ANDROID/.AndroidStudio2.3 /home/aluno; /bin/ln -s /opt/ANDROID/.gradle /home/aluno',
      creates => '/home/aluno/.android',
      timeout => 0,
      require => Exec['android_studio'],
    }
}
