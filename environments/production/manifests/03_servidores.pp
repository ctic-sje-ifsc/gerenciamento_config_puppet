# 03_servidores.pp

node "puppetMaster.sj.ifsc.edu.br" {
}

node "web1.sj.ifsc.edu.br" {
	include nginx
}
