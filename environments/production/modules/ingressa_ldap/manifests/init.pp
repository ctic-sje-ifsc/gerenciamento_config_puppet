class ingressa_ldap
 {

#a ideia eh que o modulo do banco seja instalado antes de entrar no dominio, por causa das interacoes que essa instalacao faz
#require banco

if $::kernel == windows {
	exec { 'registro':
		command => '$LM= "HKLM:\SYSTEM\CurrentControlSet\services\LanmanWorkstation\Parameters" ; New-ItemProperty -Path $LM  -Name DomainCompatibilityMode -PropertyType DWord -Value 1 -ErrorAction:SilentlyContinue | Out-Null ; New-ItemProperty -Path $LM  -Name DNSNameResolutionRequired -PropertyType DWord -Value 0 -ErrorAction:SilentlyContinue | Out-Null; New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" -Name "SyncDomainWithMembership" -PropertyType DWord -Value 0 -Force ; New-Item c:\gatilho_dominio1.txt -type file',
		provider => powershell,
		creates => 'c:\gatilho_dominio1.txt',
		}
	###### Nao funciona no windows 8 mas funciona no 7
	#exec { 'dnswins':
		#require => Exec ["registro"],
		#command => '(Get-WmiObject -Class win32_networkadapterconfiguration -Filter "IPEnabled = true").SetWINSServer("$null","$null") ; invoke-wmimethod -Class win32_networkadapterconfiguration -Name setDNSSuffixSearchOrder -ArgumentList @("sj.ifsc.edu.br"),$null ; New-Item c:\gatilho_dominio2.txt -type file',
		#provider => powershell,
		#creates => 'c:\gatilho_dominio2.txt',
		#}
	exec { 'dominio':
	#	require => Exec ["dnswins"],
		require => Exec ["registro"],
		command => '$password="b0ls40" | ConvertTo-SecureString -asPlainText -Force; $username="CEFETSC\bolctic.sj"; $credential=New-Object System.Management.Automation.PSCredential($username,$password); Add-Computer -DomainName "CEFETSC" -Credential $credential ; New-Item c:\gatilho_dominio3.txt -type file',
		#-ErrorAction SilentlyContinue -ArgumentList "/s, /v\'"/qn\'"" -wait
		provider => powershell,
		creates => 'c:\gatilho_dominio3.txt',
		}
  }else{

		#############################################################
		########################### LINUX ###########################
		#############################################################

	if $lsbdistcodename == trusty {
		#PACOTES NECESSARIOS
		$list = [ "libnss-ldap", "libpam-ldap", "ldap-utils", "smbclient", "libpam-mount", "smbnetfs", "cifs-utils", "ldap-auth-config", "ldap-auth-client",  "auth-client-config", "keyutils", "libcryptsetup4", "libhx28" ]
  	package { $list:
		ensure => latest,
		install_options => ['--allow-unauthenticated', '-y', '--force-yes'],
		}
		#pacotes removidos pra nao usar o nscd
		$list1 = [ "libpam-ccreds", "nss-updatedb", "nscd", "unscd"]
		package { $list1:
			ensure => absent,
		}
	file { 'nssupdate.sh':
			path => '/etc/cron.hourly/nssupdate.sh',
			ensure => absent,
	}
	file { 'nsswitch.conf':
			path => '/etc/nsswitch.conf',
			ensure => file,
			source => 'puppet:///modules/ingressa_ldap/nsswitch.conf',
			owner => root,
			group => root,
			mode => 0644,
	}
	file { 'ldap.conf':
		path => '/etc/ldap.conf',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/ldap.conf',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'ldap.ldap.conf':
		path => '/etc/ldap/ldap.conf',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/ldap.conf',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'lightdm':
		path => '/etc/pam.d/lightdm',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/lightdm',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'common-session':
		path => '/etc/pam.d/common-session',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/common-session',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'pam_mount.conf.xml':
		path => '/etc/security/pam_mount.conf.xml',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/pam_mount.conf.xml',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { '50-ubuntu-mate.conf':
		path => '/usr/share/lightdm/lightdm.conf.d/50-ubuntu-mate.conf',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/50-ubuntu-mate.conf',
		owner => root,
		group => root,
		mode => 0644,
	}

	include cupsd

	file { 'common-account':
		path => '/etc/pam.d/common-account',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/common-account',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'common-auth':
		path => '/etc/pam.d/common-auth',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/common-auth',
		owner => root,
		group => root,
		mode => 0644,
	}
 file { 'common-password':
		path => '/etc/pam.d/common-password',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/common-password',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'common-session-noninteractive':
		path => '/etc/pam.d/common-session-noninteractive',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/common-session-noninteractive',
		owner => root,
		group => root,
		mode => 0644,
	}
	/*
	exec { 'pam-auth-update':
  	command => "/usr/sbin/pam-auth-update --force",
  	require => [
  			File ['ldap.ldap.conf'],
  			File ['pam_mount.conf.xml'],
  			File ['50-ubuntu-mate.conf'],
				File ['client.conf'],
				File ['nsswitch.conf'],
				File ['ldap.conf'],
				File ['lightdm'],
			File ['common-session'],
				Package [$list],
				],
    	refreshonly => true,
  	}
 		*/
	}
	if $lsbdistcodename == jessie {
		#PACOTES NECESSARIOS
		$list = [ "smbnetfs", "libpam-ldap", "libnss-ldap", "libpam-mount", "cifs-utils", "cups-client" ]
		package { $list:
		ensure => latest,
		install_options => ['--allow-unauthenticated', '-y', '--force-yes'],
		}

		#pacotes removidos pra nao usar o nscd
		$list1 = [ "libpam-ccreds", "nss-updatedb", "nscd", "unscd" ]
		package { $list1:
			ensure => purged,
		}

	file { 'nssupdate.sh':
	    path => '/etc/cron.hourly/nssupdate.sh',
	    ensure => absent,
	}
	file { 'nsswitch.conf':
			path => '/etc/nsswitch.conf',
			ensure => file,
			source => 'puppet:///modules/ingressa_ldap/nsswitch.conf',
			owner => root,
			group => root,
			mode => 0644,
	}
	file { 'pam_mount.conf.xml':
		path => '/etc/security/pam_mount.conf.xml',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/pam_mount.conf.xml',
		owner => root,
		group => root,
		mode => 0644,
	}

	include cupsd

	file { 'greeter.dconf-defaults':
		path => '/etc/gdm3/greeter.dconf-defaults',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/greeter.dconf-defaults',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'libnss-ldap.conf':
		path => '/etc/libnss-ldap.conf',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/ldap.conf',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'pam_ldap.conf':
		path => '/etc/pam_ldap.conf',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/ldap.conf',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'ldap.conf':
		path => '/etc/ldap.conf',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/ldap.conf',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'common-session':
		path => '/etc/pam.d/common-session',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/common-session',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'common-account':
		path => '/etc/pam.d/common-account',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/common-account',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'common-auth':
		path => '/etc/pam.d/common-auth',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/common-auth',
		owner => root,
		group => root,
		mode => 0644,
	}
 file { 'common-password':
		path => '/etc/pam.d/common-password',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/common-password',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'common-session-noninteractive':
		path => '/etc/pam.d/common-session-noninteractive',
		ensure => file,
		source => 'puppet:///modules/ingressa_ldap/common-session-noninteractive',
		owner => root,
		group => root,
		mode => 0644,
	}
	}
	}
}
