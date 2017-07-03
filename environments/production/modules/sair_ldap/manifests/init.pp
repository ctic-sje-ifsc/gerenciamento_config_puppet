class sair_ldap {

if $::kernel == windows {

	exec { 'registro':
		command => '$LM= "HKLM:\SYSTEM\CurrentControlSet\services\LanmanWorkstation\Parameters" ; New-ItemProperty -Path $LM  -Name DomainCompatibilityMode -PropertyType DWord -Value 0 -ErrorAction:SilentlyContinue | Out-Null ; New-ItemProperty -Path $LM  -Name DNSNameResolutionRequired -PropertyType DWord -Value 1 -ErrorAction:SilentlyContinue | Out-Null; New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" -Name "SyncDomainWithMembership" -PropertyType DWord -Value 1 -Force',
		provider => powershell;
		}

	exec { 'dominio':
		require => Exec ["registro"],
		command => '(Get-WmiObject -Class Win32_ComputerSystem).UnjoinDomainOrWorkgroup($null,$null,0)',
		#-ErrorAction SilentlyContinue -ArgumentList "/s, /v\'"/qn\'"" -wait
		provider => powershell;
		}

}else{
	#PACOTES DESNECESSARIOS

	$list = [ "libnss-ldap", "libpam-ldap", "ldap-utils", "nscd", "smbclient", "libpam-mount", "smbnetfs", "cifs-utils" ]

  package { $list:
		ensure => absent,
		uninstall_options => ['--allow-unauthenticated', '-y', '--force-yes'],
  }

	file { 'nsswitch.conf':
			path => '/etc/nsswitch.conf',
			ensure => file,
			source => 'puppet:///modules/sair_ldap/nsswitch.conf',
			owner => root,
			group => root,
			mode => 0644,
	}

	file { 'lightdm':
		path => '/etc/pam.d/lightdm',
		ensure => file,
		source => 'puppet:///modules/sair_ldap/lightdm',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'client.conf':
		path => '/etc/cups/client.conf',
		ensure => absent,
	}
	file { '/etc/ldap/ldap.conf':
		ensure => absent,
	}
	file { '/etc/ldap.conf':
		ensure => absent,
	}
	file { 'pam_mount.conf.xml':
		path => '/etc/security/pam_mount.conf.xml',
		ensure => file,
		source => 'puppet:///modules/sair_ldap/pam_mount.conf.xml',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { 'common-session':
		path => '/etc/pam.d/common-session',
		ensure => file,
		source => 'puppet:///modules/sair_ldap/common-session',
		owner => root,
		group => root,
		mode => 0644,
	}
	file { '50-ubuntu-mate.conf':
		path => '/usr/share/lightdm/lightdm.conf.d/50-ubuntu-mate.conf',
		ensure => file,
		source => 'puppet:///modules/sair_ldap/50-ubuntu-mate.conf',
		owner => root,
		group => root,
		mode => 0644,
	}

}
}
