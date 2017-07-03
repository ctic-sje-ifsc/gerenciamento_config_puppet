class dropbox {

	##INICIO DO DROPBOX

	$sourcedropbox = $lsbdistcodename ? {
		#Debian 7 Wheezy
		wheezy	=> 'puppet:///modules/dropbox/dropbox.list.wheezy',
		#Ubuntu 14.04 LTS
		trusty	=> 'puppet:///modules/dropbox/dropbox.list.trusty',
		#Debian 8 Jessie
		jessie => 'puppet:///modules/dropbox/dropbox.list.jessie',
		default	=> undef,
	}

	  file { 'sources.list.dropbox':
	    path => '/etc/apt/sources.list.d/dropbox.list',
	    ensure => file,
	    source => $sourcedropbox,
	    owner => root,
	    group => root,
	    mode => 0644,
	  }

	exec { 'chave_dropbox':
	  command => "/usr/bin/apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E ; /usr/bin/apt-get update",
	  subscribe => File ['sources.list.dropbox'],
	  refreshonly => true,
		require => Package['dropbox'],
	}


	package { 'dropbox':
	  name => dropbox,
		ensure => latest,
	  require => File ['sources.list.dropbox'],
	#	install_options => ['-y, --force-yes'],
	}
	#package { 'nautilus':
	#  ensure => latest,
	#  require => File ['sources.list.dropbox'],
	#}
	package { 'python-gpgme':
	  ensure => latest,
	  require => File ['sources.list.dropbox'],
	}

	##FIM DO DROPBOX

}
