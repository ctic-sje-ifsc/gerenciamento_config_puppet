class senhaaluno {

/*
	Modulo utilizado para definir a senha do aluno com a senha padrao
*/
	user { 'aluno':
  		ensure => 'present',
		password => '$6$.6CLdqfg$3JmW2AMcTDxFuqPLv4m.kp0MpZCqfyv6hoRPQm2ZQBOmqR591vjxDuzFQe.rDy8Bact.fMqJxe8WZoLn9tb/e1',
		groups => 'vboxusers'
	}

}
