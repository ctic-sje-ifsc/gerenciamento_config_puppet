class proxy-client {
	
	concat::fragment { '02_rc.local_apaga_prefs.js':
        target => '/etc/rc.local',
        content => "# Apaga o prefs.js do usuario aluno\nrm -rf /home/aluno/.mozilla\n",
        order => '02',
    }

	file { "/etc/environment":
        content => inline_template("auto_proxy=\"\""),
    }
	
	file { 'prefs.js':
		path => '/etc/iceweasel/profile/prefs.js',
		ensure => file,
		source => 'puppet:///modules/proxy-client/prefs.js',
		owner => root,
		group => root,
		mode => 0644,
	}

}
