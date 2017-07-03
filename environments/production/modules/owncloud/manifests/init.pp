class owncloud {
	##INICIO DO OWNCLOUD

	$sourceowncloud = $lsbdistcodename ? {
		#Debian 7 Wheezy
		wheezy	=> 'puppet:///modules/owncloud/owncloud.list.wheezy',
		#Ubuntu 14.04 LTS
		trusty	=> 'puppet:///modules/owncloud/owncloud.list.trusty',
		#Debian 8 Jessie
		jessie => 'puppet:///modules/owncloud/owncloud.list.jessie',
		default	=> undef,
	}

	  file { 'sources.list.owncloud':
	    path => '/etc/apt/sources.list.d/owncloud.list',
	    ensure => file,
	    source => $sourceowncloud,
	    owner => root,
	    group => root,
	    mode => 0644,
	  }

		$keyowncloud = $lsbdistcodename ? {
			#Debian 7 Wheezy
			wheezy	=> 'puppet:///modules/owncloud/owncloud.list.wheezy',
			#Ubuntu 14.04 LTS
			trusty	=> 'puppet:///modules/owncloud/owncloud.list.trusty',
			#Debian 8 Jessie
			jessie => 'puppet:///modules/owncloud/owncloud.list.jessie',
			default	=> undef,
		}

	if $lsbdistcodename == 'trusty' {
		exec { 'Release.key':
			command => "/usr/bin/wget -q http://download.opensuse.org/repositories/isv:ownCloud:desktop/Ubuntu_14.04/Release.key -O- | /usr/bin/sudo apt-key add - ; /usr/bin/apt-get update",
			subscribe => File ['sources.list.owncloud'],
			refreshonly => true,
		}
	}
	elsif $lsbdistcodename == 'jessie' {
		exec { 'Release.key':
			command => "/usr/bin/wget -q http://download.opensuse.org/repositories/isv:ownCloud:desktop/Debian_8.0/Release.key -O- | /usr/bin/sudo apt-key add - ; /usr/bin/apt-get update",
			subscribe => File ['sources.list.owncloud'],
			refreshonly => true,
		}
	}
	elsif $lsbdistcodename == 'wheezy' {
		exec { 'Release.key':
			command => "/usr/bin/wget -q http://download.opensuse.org/repositories/isv:ownCloud:desktop/Debian_7.0/Release.key -O- | /usr/bin/sudo apt-key add - ; /usr/bin/apt-get update",
			subscribe => File ['sources.list.owncloud'],
			refreshonly => true,
		}
	}

	package { 'owncloud-client':
	  name => owncloud-client,
		ensure => latest,
	  require => File ['sources.list.owncloud'],
		install_options => ['--allow-unauthenticated', '-y', '--force-yes'],
	}
	##FIM DO OWNCLOUD

}
