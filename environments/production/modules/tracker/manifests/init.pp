class tracker {


    file { 'tracker.desktop':
  		path => '/usr/share/applications/tracker.desktop',
  		ensure => file,
      source => 'puppet:///modules/tracker/tracker.desktop',
  		owner => root,
  		group => root,
  		mode => 644,
      require => File['dir_tracker'],
  	}

    file { 'dir_tracker':
  		path => '/opt/tracker',
  		ensure => file,
      source => 'puppet:///modules/tracker/tracker',
  		owner => root,
  		group => root,
  		mode => 1775,
  		recurse => true,
  	}
}
