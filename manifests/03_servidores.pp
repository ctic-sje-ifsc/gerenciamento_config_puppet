# 03_servidores.pp

node "puppetMaster.sj.ifsc.edu.br" {
}

node "web1.sj.ifsc.edu.br" {
	include nginx
}

node /storage[1-2]/ {

	include rede_storage
	class { ::gluster::repo:
	   version => 'LATEST',
	}
	class { gluster::install:
	  server  => true,
	  client  => false,
	  repo    => true,
	  version => 'LATEST',
	}
	class { ::gluster::service:
  		ensure => running,
	}
}
