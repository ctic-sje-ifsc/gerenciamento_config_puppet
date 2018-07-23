class openjdk-7u111 {

	 if $lsbdistcodename == jessie {

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
/*	#Comentado para testar o modulo rstudio, a pedido do Noronha	
		exec {"set_mozilla-javaplugin.so":
		    command => "/usr/sbin/update-alternatives --set mozilla-javaplugin.so /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so",
		    require => package['openjdk-7-jre'],
		}
*/		
 	}

	if $lsbdistcodename == trusty {
		
		exec {"mozillateam/ppa":
			command => "/usr/bin/add-apt-repository ppa:mozillateam/ppa -y ; /usr/bin/touch /var/mozillateam_ppa",
			creates => '/var/mozillateam_ppa',
		}
		package { 'firefox':
             ensure => 'absent',
        }
		package {'firefox-esr':
			ensure => 'installed',
			require => exec['mozillateam/ppa'],
		}
		package {'firefox-esr-locale-pt':
			ensure => 'installed',
			require => exec['mozillateam/ppa'],
		}
		
		package { 'openjdk-7-jre-headless':
             ensure => '7u51-2.4.6-1ubuntu4',
        }
        package { 'openjdk-7-jre':
             ensure => '7u51-2.4.6-1ubuntu4',
        }
        package { 'icedtea-7-plugin':
	         ensure => 'latest',
        }

		package {'oracle-java8-installer':
			ensure => 'absent',
		}

		exec { "hold_openjdk-7u51":
             command => "/usr/bin/apt-mark hold openjdk-7-jre openjdk-7-jre-headless ; /usr/bin/touch /var/hold_openjdk-7u51",
             creates => '/var/hold_openjdk-7u51',
             require => package['openjdk-7-jre'],
        }

	}	

}
