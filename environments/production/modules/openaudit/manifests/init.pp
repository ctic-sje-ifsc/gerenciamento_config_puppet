class openaudit {

	if $::kernel == linux {
		schedule { 'rasoavel':
  			period => daily,
  			repeat => 6,
		}

		file { 'audit_linux.sh':
			path => '/etc/init.d/audit_linux.sh',
			ensure => file,
			source => 'puppet:///modules/openaudit/audit_linux.sh',
			owner => root,
			group => root,
			mode => 0755,
		}

		exec { '/etc/init.d/audit_linux.sh':
			schedule => 'rasoavel',
			require => File['audit_linux.sh'],
		}

		cron { '/etc/init.d/audit_linux.sh':
  		    command => '/etc/init.d/audit_linux.sh',
		    ensure => absent,
		    user    => 'root',
  		    minute  => '*',
	  	    hour	 =>	'*/1',
		}

	}

	if $::kernel == windows {

		file { 'audit_windows.vbs':
			path => 'c:\audit_windows.vbs',
			ensure => file,
			source => 'puppet:///modules/openaudit/audit_windows.vbs',
			mode => '0555',
		    source_permissions => ignore,
		}

		exec { 'c:\audit_windows.vbs':
        	command => "cmd.exe /c c:\audit_windows.vbs",
	    	path => 'c:\windows\system32',
			schedule => daily,
       		require => File['audit_windows.vbs'],
		}
	}

}
