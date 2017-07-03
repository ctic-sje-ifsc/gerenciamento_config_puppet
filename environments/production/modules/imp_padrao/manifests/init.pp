class imp_padrao {

  case $hostname {
    /^sj-lin-mcul/: {$imp_padrao = 'puppet:///modules/imp_padrao/mcul_imp_padrao.sh'}
    /^sj-lin-dire/: {$imp_padrao = 'puppet:///modules/imp_padrao/dire_imp_padrao.sh'}
    /^sj-lin-reg/: {$imp_padrao = 'puppet:///modules/imp_padrao/reg_imp_padrao.sh'}
}

    file { 'imp_padrao':
  		path => '/etc/profile.d/imp_padrao.sh',
  		ensure => file,
  		source => $imp_padrao,
  		owner => root,
  		group => root,
  		mode => 644,
  	}
}
