class progpadroeslabs {

  exec { 'apt-get.update':
    command => "/usr/bin/apt-get update",
    schedule => daily,
  }

####################################INICIO DO VIRTUALBOX-5
  $source = $lsbdistcodename ? {
    #Ubuntu 14.04 LTS
    trusty	=> 'puppet:///modules/progpadroeslabs/trusty.virtualbox.list',
    #debian jessie
    jessie => 'puppet:///modules/progpadroeslabs/jessie.virtualbox.list',
    default	=> undef,
  }
  file { 'sources.list.virtualbox':
		path => '/etc/apt/sources.list.d/virtualbox.list',
		ensure => file,
		source => $source,
		owner => root,
		group => root,
		mode => 0644,
	}

  exec { 'oracle_vbox.asc':
		command => "/usr/bin/wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | /usr/bin/sudo apt-key add -; /usr/bin/wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | /usr/bin/sudo apt-key add -; /usr/bin/apt-get update",
    subscribe => File ['sources.list.virtualbox'],
		refreshonly => true,
  }
  package { 'virtualbox-5.0':
		ensure => latest,
    require => File ['sources.list.virtualbox'],
	}


  #baixa e instala o extension pack
  file { 'installExtension.sh':
    path => '/usr/local/src/installExtension.sh',
    ensure => file,
    source => 'puppet:///modules/progpadroeslabs/installExtension.sh',
    owner => root,
    group => root,
    mode => 777,
  }

  exec { 'executar_installExtension.sh':
    command => '/bin/bash /usr/local/src/installExtension.sh',
    require => [
        File['installExtension.sh'],
    ],
    # so executa senao tiver o arquivo abaixo
    creates => '/usr/local/src/gatilho_VM_extension',
    timeout => 0,
  }
## Para resolver o problema da janela de informacao que ficava fundo amarelo com letra branca do chamado IFSC#2017082510000862
  file {'remove_arquivo_troll':
    path => '/home/aluno/.config/Trolltech.conf',
    ensure => absent,
  }

  #exec { 'wget_extpack':
  #  command => '/usr/bin/wget -P /home/imagens/ http://download.virtualbox.org/virtualbox/5.0.22/Oracle_VM_VirtualBox_Extension_Pack-5.0.22-108108.vbox-extpack ; /usr/bin/VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.0.22-108108.vbox-extpack',
    # so executa senao tiver o arquivo abaixo
  #  creates => '/home/imagens/Oracle_VM_VirtualBox_Extension_Pack-5.0.22-108108.vbox-extpack',
  #  timeout => 0,
  #}

################################################ FIM DO VIRTUALBOX-5

##################################NETBEANS 8
  include netbeans8
  package { 'netbeans':
    ensure => absent,
  }
###################################

##############INCLUDES
  include astah
  include zoiper3-3
  include owncloud
  include qgis
  include java_oracle
  include quartus_gravacao
  include octave
  include atom
  include gnu_radio
###################################


###################INICIO DO CHROMIUM

	$chromium = $operatingsystem ? {
    ubuntu  => 'chromium-browser',
    debian => 'chromium',
  }
	$chromium_l10n = $operatingsystem ? {
    ubuntu  => 'chromium-browser-l10n',
    debian => 'chromium-l10n',
  }

  package { $chromium:
		ensure => latest,
	}
	package { $chromium_l10n:
		ensure => latest,
	}
############################FIM DO CHROMIUM


 ##INICIO DOS PROGRAMAS BASICOS
if $lsbdistcodename == jessie {
 $list = [ "mcu8051ide", "ethtool", "minicom", "nmap", "vim", "gedit", "geany", "unrar", "ntfs-3g", "scratch", "latexila", "abntex", "eagle:i386", "texlive-lang-portuguese", "tree", "vlc", "pepperflashplugin-nonfree", "kicad", "gdb", "audacity", "gimp", "inkscape", "libreoffice", "libreoffice-l10n-pt-br", "kdenlive", "pitivi", "konsole", "g++-4.8", "kalzium", "git", "subversion", "traceroute", "lib32stdc++6", "libc6-dev-i386" ,"dia", "python3", "ipython3", "spyder3", "logisim", "okular", "gcc-avr", "gcc-arm-none-eabi", "x2goclient", "pinta", "avr-libc", "avrdude", "fritzing", "fritzing-data", "uuid-dev", "as31", "kile", "kile-l10n", "libswt-gtk-3-jni:i386", "ssh", "cutecom", "sqlite3", "glade", "libssl-dev", "libgtkmm-2.4-dev", "libgtkmm-3.0-dev", "libgtk-3-dev", "libglade2-dev", "libglademm-2.4-dev", "libpcre++-dev", "libboost-all-dev", "libsqlite3-dev", "libcurl4-openssl-dev", "libstdc++-4.8-dev", "libnl-3-dev", "libnl-genl-3-dev", "libdbus-1-dev", "libpcap-dev", "rabbitmq-server", "python-virtualenv", "u-boot-tools", "ipcalc", "wxmaxima", "kolourpaint4", "xournal", "iperf", "chrpath", "diffstat", "browser-plugin-freshplayer-pepperflash", "mysql-workbench", "mysql-client", "npm", "nodejs", "nodejs-legacy", "xpdf", "gnupg2", "mosquitto-clients"]

  file { 'libpepflashplayer.so':
     path => '/usr/lib/pepperflashplugin-nonfree/libpepflashplayer.so',
     ensure => file,
     source => 'puppet:///modules/progpadroeslabs/libpepflashplayer.so',
     owner => root,
     group => root,
     mode => 0644,
   }

}else {
    #retiramos o libglade2-dev, "libgtkmm-3.0-dev" "libgtkmm-2.4-dev", "libgtk-3-dev", "libglade2-dev", "libswt-gtk-3-jni:i386",  porque estava saindo do repositorio
	$list = [ "mcu8051ide", "ethtool", "minicom", "nmap", "vim", "gedit", "geany", "unrar", "ntfs-3g", "scratch", "latexila", "abntex", "eagle:i386", "texlive-lang-portuguese", "tree", "vlc", "kicad", "gdb", "audacity", "gimp", "avidemux", "inkscape", "libreoffice", "libreoffice-l10n-pt-br", "kdenlive", "pitivi", "konsole", "g++-4.8", "kalzium", "git", "subversion", "traceroute", "lib32stdc++6", "libc6-dev-i386" ,"dia", "python3", "ipython3", "spyder3", "logisim", "okular", "gcc-avr", "gcc-arm-none-eabi", "x2goclient", "pinta", "avr-libc", "avrdude", "gcc-arm-linux-gnueabi", "g++-arm-linux-gnueabi", "fritzing", "fritzing-data", "uuid-dev", "linux-headers-generic", "as31", "kile", "kile-l10n", "ssh", "cutecom", "sqlite3", "glade", "libssl-dev", "libpcre++-dev", "libboost-all-dev", "libsqlite3-dev", "libcurl4-openssl-dev", "libstdc++-4.8-dev", "libnl-3-dev", "libnl-genl-3-dev", "libdbus-1-dev", "libpcap-dev", "rabbitmq-server", "python-virtualenv", "u-boot-tools", "ipcalc", "wxmaxima", "kolourpaint4", "xournal", "iperf", "chrpath", "diffstat", "adobe-flashplugin", "mysql-workbench", "mysql-client", "maven2", "gradle", "npm", "nodejs", "nodejs-legacy", "xpdf", "gnupg2", "mosquitto-clients"]

  $package_purge = [ "pepperflashplugin-nonfree", "flashplugin-installer" ]
}

  package { $list:
		ensure => latest,
  }

  package { $package_purge:
    ensure => purged;
  }

  #patch do xpdf que o mello pediu no chamado IFSC#2017033110000038
  file { 'xpdf_com_patch':
     path => '/usr/bin/xpdf',
     ensure => file,
     source => 'puppet:///modules/progpadroeslabs/xpdf',
     owner => root,
     group => root,
     mode => 0755,
   }

  ## INICIO DOS PACOTES PARA CRIPTOGRAFAR O HOME DO USUARIO
  #Arliones pediu para instalar no tiquete 2016021110000212

  $list2 = [ "ecryptfs-utils", "cryptsetup" ]
  package { $list2:
    ensure => latest,
  }

  ## FIM DOS PACOTES PARA CRIPTOGRAFAR O HOME DO USUARIO

  
  ### lista pedida pelo arliones
  # retiramos porque estava com problema do repositorio "libcanberra-gtk-module:i386" "gtk2-engines-murrine:i386" "libgtk2.0-dev"
  $list3 = [ "cmake", "pkg-config", "libavcodec-dev", "libavformat-dev", "libswscale-dev", "python-dev", "python-numpy", "libtbb2", "libtbb-dev", "libjpeg-dev", "libjasper-dev", "libdc1394-22-dev", "libopencv-*", "qemu-system-x86", "qemu-utils", "qemu-common", "libxt6:i386", "libdbus-glib-1-2:i386", "libasound2:i386", "libxpm4:i386", "libusb-0.1-4:i386" ]

  package { $list3:
    ensure => latest,
  }

############################ FIM DOS PROGRAMAS BASICOS

############## INICIO DO PHYTHON-PIP
  package { 'python-pip':
	  ensure => latest,
	}

  # $list4 = ["flask", "flask-httpauth"]
  #
  # package { $list4:
  #   ensure => latest,
  #   provider => "pip"
  # }

	exec { "executa_pip":
	   command => '/usr/bin/pip install flask ; /usr/bin/pip install flask-httpauth ; /usr/bin/touch /var/gatilho_executa_pip',
	    require => package ['python-pip'],
      creates => '/var/gatilho_executa_pip',
	  }
##########################################

##INICIO DO WIRESHARK
  package { 'wireshark':
    ensure => latest,
  }

############################ #inicio do geogebra 5
package { 'geogebra':
  ensure => purged,
}

file { 'sources.list.geogebra':
  path => '/etc/apt/sources.list.d/geogebra.list',
  ensure => file,
  source => 'puppet:///modules/progpadroeslabs/geogebra.list',
  owner => root,
  group => root,
  mode => 0644,
}

exec { "chave_geogebra_e_update":
  command => '/usr/bin/wget -q https://static.geogebra.org/linux/office@geogebra.org.gpg.key -O- | /usr/bin/sudo apt-key add - ; /usr/bin/apt-get update ; /usr/bin/touch /var/gatilho_geogebra',
  creates => '/var/gatilho_geogebra',
  timeout => 0,
  require => file ['sources.list.geogebra'],
}
  package { 'geogebra5':
    ensure => latest,
    require => [
        package ['geogebra'],
        exec ['chave_geogebra_e_update'],
        file ['sources.list.geogebra'],
    ],

  }
###################################################################


####OUTROS

## Coisa do Luciano

file { 'mercurio':
  path => '/usr/bin/MercurioIV_Linux_1.1.0.run',
  ensure => file,
  source => 'puppet:///modules/progpadroeslabs/MercurioIV_Linux_1.1.0.run',
  owner => root,
  group => root,
  mode => 0500,
}

####

##Casagrande: Ha a necessidade de que o usuario aluno esteja no grupo dialout para que o mesmo tenha acesso as portas seriais (ttyS0, ttyUSB0 e ttyACM0, geralmente) para ter acesso fisico a porta serial ou conversor serial-usb
  exec { 'addgroup dialout':
		command => "/usr/sbin/usermod -a -G dialout aluno ; /usr/sbin/usermod -a -G dialout arliones.hoeller ; /usr/sbin/usermod -a -G dialout fernando.rodrigues",
    schedule => daily,
	}
##Bau: Liberacao da porta paralela
  exec { 'chmod parport0':
		command => "/bin/chmod a+rw /dev/parport0",
    onlyif => '/usr/bin/test -e /dev/parport0',
	}
##faz o downgrade da versao do libreoffice
 exec { "att_libreoffice_5_0_5":
   command => '/usr/bin/apt-get remove -y --purge libreoffice* ; /usr/bin/apt-get update ; /usr/bin/apt-get clean ; /usr/bin/add-apt-repository -y --remove ppa:libreoffice/ppa ; /usr/bin/add-apt-repository -y ppa:libreoffice/libreoffice-5-0 ; /usr/bin/apt-get update ; /usr/bin/apt-get -y install libreoffice ; /usr/bin/touch /var/gatilho_libreoffice',
   creates => '/var/gatilho_libreoffice',
   timeout => 0,
 }


##Corrige programa padrao abrir pdf(estava abrindo com o gimp) Podemos usar para definir padrao para abrir qualquer arquivo
if $lsbdistcodename == trusty {
  file { 'defaults.list':
    path => '/etc/gnome/defaults.list',
    ensure => file,
    source => 'puppet:///modules/progpadroeslabs/defaults.list',
    owner => root,
    group => root,
    mode => 0644,
  }
}

exec { 'wireshark non-root':
  command => "/sbin/setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap",
  require => Package ['wireshark'],
  schedule => daily,
}

package { 'resolvconf':
  ensure => latest,
}

############ necessarios para o quartus no debian
	$list5 = [ "libbz2-1.0:i386", "libsm6:i386" ]
	package { $list5:
	  ensure => latest,
	}
############

file { 'trocaIP.sh':
  path => '/trocaIP.sh',
  ensure => file,
  source => 'puppet:///modules/progpadroeslabs/trocaIP.sh',
  owner => root,
  group => root,
  mode => 0777,
}

	package { ['dnsutils', 'whois']:
		ensure => latest,
	}

}
