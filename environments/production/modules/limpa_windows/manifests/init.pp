class limpa_windows {

##Deve-se realizar esse procedimento todo o final do semestre.

	exec { 'zerar_temp':
		command => 'Remove-Item C:\Windows\TEMP\* -recurse',
		provider => powershell,
		schedule => daily,
	}

}
