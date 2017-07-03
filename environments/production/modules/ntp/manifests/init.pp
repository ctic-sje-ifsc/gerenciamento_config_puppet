class ntp {
#; Start-Service w32time	w32tm.exe /config /manualpeerlist:"a.st1.ntp.br pool.ntp.br" /syncfromflags:manual /reliable:YES /update
if $::kernel == windows {
	exec { 'winntp':
		command => 'Start-Service w32time	w32tm.exe /config /manualpeerlist:"a.st1.ntp.br pool.ntp.br" /syncfromflags:manual /reliable:YES /update',
		provider => powershell,
		creates => 'C:\gatilho_ntp.txt',
		}
	exec { 'gatilho':
		command => 'New-Item c:\gatilho_ntp.txt -type file',
		require => Exec[winntp],
		creates => 'C:\gatilho_ntp.txt',
		#onlyif => 'test-path C:\gatilho_ntp.txt',
		provider => powershell
		}

	}else{

		package { 'ntp':
			name => 'ntp',
			ensure => installed,
		}
		service { 'ntp':
			ensure => running,
			enable => true,
			require => Package['ntp'],
		}
	}

}
