class auto_desligamento
 {
if $::kernel == windows {
  scheduled_task { 'Desligar_computador':
  ensure    => present,
  enabled   => true,
  command   => 'C:\Windows\system32\shutdown.exe',
  arguments => '-f -t 1',
  trigger   => {
    schedule   => daily,
    every      => 1,            # Uma vez por dia.
    start_time => '23:00',
    minutes_interval => '30',   # Repetir a cada 30 minutos
    minutes_duration => '120',  # Tarefa vai se repedir por 2 horas
  }
}


  }else{

		#############################################################
		########################### LINUX ###########################
		#############################################################
    cron { 'poweroff':
      command => '/sbin/poweroff -f',
      user    => 'root',
      hour    => 23,
      minute  => 0,
      ensure => present,
}

	}
}
