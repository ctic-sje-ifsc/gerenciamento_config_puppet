class proglabalunos {

	package { 'network-manager':
        ensure => absent,
    }

    package { 'resolvconf':
        ensure => installed,
    }

	#Programas basicos alunos
	$list = [ "wireshark", "geany", "mcu8051ide", "vim", "netbeans", "eclipse", "vlc", "virtualbox", "scratch", "latexila", "abntex", "texlive-lang-portuguese", "chromium-l10n", "flashplugin-nonfree", "pepperflashplugin-nonfree","deb-multimedia-keyring", "gdb", "audacity", "ardour", "lmms", "blender", "gimp", "avidemux", "inkscape", "kdenlive", "pitivi", "g++", "gcc-avr", "gcc-arm-none-eabi"]
	package { $list:
		ensure => installed,
        install_options => ['--force-yes'],
	}

	exec { 'wireshark non-root':
		command => "/sbin/setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap",
		require => Package [$list],
	}

#	exec { "add aluno to group wireshark": 
#		command => "/usr/sbin/usermod -a -G wireshark aluno",
#		require => Package [$list],
#	}

}
