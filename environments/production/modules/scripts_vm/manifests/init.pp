class scripts_VM {
	####Script Criar VM

	file { 'recoverVM':
	  path => '/recoverVM.sh',
	  ensure => file,
	  source => 'puppet:///modules/scripts_vm/recoverVM.sh',
	  owner => aluno,
	  group => aluno,
	  mode => 0775,
	}

	###

}
