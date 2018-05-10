class progsadm {

	#Programas basicos adm
	$list = [ "vlc", "unrar", "ssh", "ntfs-3g", "okular", "pdfsam", "libreoffice-l10n-pt-br", "libreoffice-help-pt-br", "libreoffice-gtk", "pepperflashplugin-nonfree", "vim", "ttf-mscorefonts-installer", "aptitude", "libreoffice", "remmina", "dia", "inkscape", "gimp", "xournal", "pinta", "gpaint", "gnome-paint", "kolourpaint4", "kde-l10n-ptbr", "kdenlive", "xpad"]
  		#"deb-multimedia-keyring" tirei, nao sei porque colocamos, quando aparecer colocamos novamente
		$chromium = $operatingsystem ? {
      		ubuntu  => 'chromium-browser',
	    	debian => 'chromium',
		}
		$chromium_l10n = $operatingsystem ? {
        	ubuntu  => 'chromium-browser-l10n',
        	debian => 'chromium-l10n',
    	}
		$flash = $operatingsystem ? {
			ubuntu  => 'flashplugin-installer',
			debian  => 'browser-plugin-freshplayer-pepperflash',
		}
	 	package { $flash:
      	ensure => latest,
    }
	##install skype
	file { 'source_skype':
		path => '/etc/apt/sources.list.d/skype.list',
		ensure => file,
		source => 'puppet:///modules/progsadm/skype.list',
		owner => root,
		group => root,
		mode => 0644,
	}

	exec { 'install_skype':
        command => "/usr/bin/curl https://repo.skype.com/data/SKYPE-GPG-KEY | /usr/bin/apt-key add - ; /usr/bin/apt-get update ; /usr/bin/touch /var/gatilho_install_skype",
        creates => "/var/gatilho_install_skype",
    }

	package { 'skypeforlinux':
		ensure => latest,
		require => [
			File['source_skype'],
			exec['install_skype'],
		],
	}

	###define programas padroes para abrir determinados arquivos

	if $lsbdistcodename == jessie {
		file { 'defaults.list':
			path => '/etc/gnome/defaults.list',
			ensure => file,
			source => 'puppet:///modules/progsadm/defaults.list',
			owner => root,
			group => root,
			mode => 0644,
			require => file['gnome.defauts'],
	}
	file { 'gnome.defauts':
			path => '/etc/gnome',
			ensure => directory,
			owner => root,
			group => root,
			mode => 0755,
	}
	}
###


	package { $list:
		ensure => latest,
		#install_options => ['--allow-unauthenticated', '-y', '--force-yes'],
	}
	package { $chromium:
		ensure => latest,
	}
	package { $chromium_l10n:
		ensure => latest,
	}

	exec { "update-pepperflashplugin":
		command => "/usr/sbin/update-pepperflashplugin-nonfree --install",
		schedule => daily,
		onlyif => '/usr/bin/test -e /usr/sbin/update-pepperflashplugin-nonfree';
	}
	exec { "update-flashplugin":
		command => "/usr/sbin/update-flashplugin-nonfree --install",
		schedule => daily,
		onlyif => '/usr/bin/test -e /usr/sbin/update-flashplugin-nonfree';
	}

	exec { 'add_gpg_pepperflash':
		command => "/usr/bin/gpg --keyserver pgp.mit.edu --recv-keys 1397BC53640DB551 ; gpg --export --armor 1397BC53640DB551 | /usr/bin/sudo sh -c 'cat >> /usr/lib/pepperflashplugin-nonfree/pubkey-google.txt' ; /usr/bin/touch /var/gatilho_add_gpg_pepperflash",
		creates => '/var/gatilho_add_gpg_pepperflash',
	}

	file { 'libpepflashplayer.so':
			path => '/usr/lib/pepperflashplugin-nonfree/libpepflashplayer.so',
			ensure => file,
			source => 'puppet:///modules/progsadm/libpepflashplayer.so',
			owner => root,
			group => root,
			mode => 0644,
	}

	file { 'dhclient.conf':
			path => '/etc/dhcp/dhclient.conf',
			ensure => file,
			source => 'puppet:///modules/progsadm/dhclient.conf',
			owner => root,
			group => root,
			mode => 0644,
	}

	include x11vnc
	include owncloud
	include dropbox
#	include java_oracle
	include irpf_lin


}
