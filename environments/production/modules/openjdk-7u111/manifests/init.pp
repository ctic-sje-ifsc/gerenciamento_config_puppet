class openjdk-7u111 {

  package { 'openjdk-7-jre-headless':
		ensure => '7u111-2.6.7-1~deb8u1',
  }
	package { 'openjdk-7-jre':
		ensure => '7u111-2.6.7-1~deb8u1',
	}
	package { 'icedtea-7-plugin':
		ensure => 'latest',
	}

  exec { "hold_openjdk-7u111":
    command => "/usr/bin/apt-mark hold openjdk-7-jre openjdk-7-jre-headless ; /usr/bin/touch /var/hold_openjdk-7u111",
    creates => '/var/hold_openjdk-7u111',
    require => package['openjdk-7-jre'],
  }

  exec {"set_mozilla-javaplugin.so":
    command => "/usr/sbin/update-alternatives --set mozilla-javaplugin.so /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so",
    require => package['openjdk-7-jre'],
  }

}
