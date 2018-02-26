class auto_desligamento
 {
if $::kernel == windows {
  #############################################################
  ########################## WINDOWS ##########################
  #############################################################
  scheduled_task { 'Desligar_computador':
  ensure    => present,
  enabled   => true,
  command   => 'C:\Windows\system32\shutdown.exe',
  arguments => '-s -t 1',
  trigger   => {
    schedule   => daily,
    start_time => '23:00',
    #every      => 1,            # Uma vez por dia.
    #minutes_interval => '30',   # Repetir a cada 30 minutos
    #minutes_duration => '120',  # Tarefa vai se repedir por 2 horas
    }
  }

  }else{
    ## AINDA NAO AUTORIZADO PELO DIRETOR
		#############################################################
		########################### LINUX ###########################
		#############################################################
    #3cron { 'poweroff':
    #3  command => '/sbin/poweroff',
    #3  user    => 'root',
    #3  hour    => 23,
    #3  minute  => 00,
    #3  ensure => present,
    }

	}
}
