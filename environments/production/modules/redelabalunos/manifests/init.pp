class redelabalunos {

	package { 'iptables':
		ensure => installed,
	}
concat::fragment { '02_rc.local_route_nat':
        target => '/etc/rc.local',
        content => "#limpa a tabela nat\niptables -t nat -F\n\niptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE\niptables -t nat -A PREROUTING -i eth0 ! -d 192.168.4.254 -p tcp --dport 80 -j REDIRECT --to-port 3128\necho 1 > /proc/sys/net/ipv4/ip_forward\n",
        order => '02',
    }

	file { 'interfaces':
		path => '/etc/network/interfaces',
		ensure => file,
		source => 'puppet:///modules/redelabalunos/interfaces',
		owner => root,
		group => root,
		mode => 0644,
	}
}
