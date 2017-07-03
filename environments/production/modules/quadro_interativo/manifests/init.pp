class quadro_interativo{
	##PROGRAMA PARA CALIBRAR
	package { 'xterm':
		ensure => latest,
	}
	package { 'xinput-calibrator':
		ensure => latest,
		require => package['xterm'],
	}
##PROGRAMA PARA DESENHAR - tiramos porque foi colocado no progsadm
#	package { 'xournal':
#		ensure => latest,
#	}
}
