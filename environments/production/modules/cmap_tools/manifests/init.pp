class cmap_tools {

	file { 'cmaptools':
		path => '/usr/share/applications/cmaptools.desktop',
		ensure => file,
		source => 'puppet:///modules/cmap_tools/cmaptools.desktop',
		owner => root,
		group => root,
		mode => 0644,
		require => File['dir_cmaptools'],
	}

	file { 'dir_cmaptools':
		path => '/opt/CmapTools',
		ensure => file,
		source => 'puppet:///modules/cmap_tools/CmapTools',
		owner => root,
		group => root,
		mode => 1775,
		recurse => true,
	}

}
