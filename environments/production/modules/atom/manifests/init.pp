class atom {

	case $::osfamily {
		'Debian': {
			$arquivo = '/usr/local/src/atom-amd64.deb'

			file { 'atom-amd64.deb':
				path => $arquivo,
				owner => root,
				group => root,
				mode => 0644,
				source => 'puppet:///modules/atom/atom-amd64.deb',
			}

			exec { 'dpkg:atom-amd64.deb':
				command => "/usr/bin/dpkg -i $arquivo",
				subscribe => File['atom-amd64.deb'],
				refreshonly => true,
			}

		}

	}

}
