class sophia {
  if $::kernel == windows {
    file {'sophia':
      path => 'C:\SPHBIB',
      ensure => file,
      recurse => true,
      source => 'puppet:///modules/sophia/SPHBIB/',
      source_permissions => ignore,
    }
    file {'icone_desktop_sophia':
      path => 'C:\Users\Public\Desktop\SophiA - Gerenciador.lnk',
      ensure => file,
      source => 'puppet:///modules/sophia/sophia.lnk',
		  require => File ['sophia'],
      source_permissions => ignore,
    }
  }
  else {
    package { 'wine':
  		ensure => latest,
  	}
    package { 'libwine-print:i386':
  		ensure => latest,
  	}
    package { 'libcups2:i386':
  		ensure => latest,
  	}

    file { 'sophia.desktop':
		  path => '/usr/share/applications/sophia.desktop',
		  ensure => file,
		  source => 'puppet:///modules/sophia/sophia.desktop',
		  owner => root,
		  group => root,
		  mode => 0644,
	   }

    file { 'sophia_linux':
  		path => '/opt/sphbib',
  		ensure => file,
  		source => 'puppet:///modules/sophia/SPHBIB/',
      recurse => true,
  		owner => root,
  		group => root,
  		mode => 0777,
  	}
    file { 'wine.tar':
      path => '/usr/local/src/wine.tar',
      ensure => file,
      source => 'puppet:///modules/sophia/wine.tar',
      owner => root,
      group => root,
      mode => 777,
    }

    exec { 'descompactar_wine':
      command => '/bin/tar -zxvf /usr/local/src/wine.tar -C /etc/skel/ ',
      require => [
          File['wine.tar'],
      ],
      creates => '/etc/skel/.wine',
      timeout => 0,
    }

  }
}
