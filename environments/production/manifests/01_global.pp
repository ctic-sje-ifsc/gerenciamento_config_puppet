# 01_global.pp

include openaudit

if ($hostname =~ /^server-/) {

}else {
	if $::kernel == linux and $lsbdistcodename != 'stretch' {
		include sistema
		include ntp
		##apaga o lock com mais de 3 horas
		cron { 'apaga_lock':
  		command => '/usr/bin/find /var/lib/puppet/state/agent_catalog_run.lock -mmin +180 -delete',
  		user    => 'root',
  		minute  => '*/30',
	  	hour	  =>	'*',
		}
	}
}
