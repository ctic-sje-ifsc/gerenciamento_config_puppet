class rclocal{

	file { 'rc.local':
		path => '/etc/rc.local',
		ensure => file,
		source => 'puppet:///modules/rclocal/rc.local',
		owner => root,
		group => root,
		mode => 0755,
	}

##RCLOCAL ANTIGO COM O CONCAT
/*
	concat { '/etc/rc.local':
        ensure => present,
		owner => 'root',
		group => 'root',
		mode => '0755',
    }

    concat::fragment { '00_rc.local_header':
		target  => '/etc/rc.local',
		content => "#!/bin/sh -e\n# This file is manageed by Puppet, do not modify!\n\n",
		order   => '01',
    }

	concat::fragment { '98_rc.local_puppet_agent':
        target  => '/etc/rc.local',
        content => "\nsleep 120\npuppet agent -t\n",
        order   => '98',
    }

    concat::fragment { '99_rc.local_footer':
		target  => '/etc/rc.local',
		content => "\n\nexit 0\n",
		order   => '99',
	}
*/

}
