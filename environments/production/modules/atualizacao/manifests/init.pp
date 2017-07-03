class atualizacao {



#	if $::kernel == windows {
	file {'module':
		path => 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\PSWindowsUpdate',
		ensure => file,
		recurse => true,
		source => 'puppet:///modules/atualizacao/PSWindowsUpdate/',
		source_permissions => ignore,
	}
	#Hide-WUUpdate -Title "Atualizar para o windows 10*"
	#Get-WUInstall –AcceptAll #opcional –AutoReboot
#		exec { 'registro':
#			command => '$LM= "HKLM:\SYSTEM\CurrentControlSet\services\LanmanWorkstation\Parameters" ; New-ItemProperty -Path $LM  -Name DomainCompatibilityMode -PropertyType DWord -Value 1 -ErrorAction:SilentlyContinue | Out-Null ; New-ItemProperty -Path $LM  -Name DNSNameResolutionRequired -PropertyType DWord -Value 0 -ErrorAction:SilentlyContinue | Out-Null; New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" -Name "SyncDomainWithMembership" -PropertyType DWord -Value 0 -Force',
#			provider => powershell;
#			}


#    }else{

		#PACOTES NECESSARIOS

#  }
}
