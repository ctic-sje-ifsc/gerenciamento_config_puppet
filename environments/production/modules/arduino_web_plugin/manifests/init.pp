class arduino_web_plugin {

	file { 'arduino-create-agent.desktop':
		path => '/etc/xdg/autostart/arduino-create-agent.desktop',
		ensure => file,
		source => 'puppet:///modules/arduino_web_plugin/arduino-create-agent.desktop',
		owner => root,
		group => root,
		mode => 0644,
	}
/*
	file { 'ArduinoCreateAgent-1.1':
		path => '/usr/local/ArduinoCreateAgent-1.1',
		ensure => directory,
		#source => 'puppet:///modules/arduino_web_plugin/ArduinoCreateAgent-1.1',
		#recurse => true,
		owner => root,
		group => root,
		mode => 1777,
	}
*/
		package { 'libappindicator3-1':
			ensure => installed,
		}

		file { 'ArduinoCreateAgent-1.1-linux-x64-installer.run':
			path => '/usr/local/src/ArduinoCreateAgent-1.1-linux-x64-installer.run',
			ensure => file,
			source => 'puppet:///modules/arduino_web_plugin/ArduinoCreateAgent-1.1-linux-x64-installer.run',
			owner => root,
			group => root,
			mode => '1777',
		}

		exec { 'install_arduino_agent':
			command => '/usr/local/src/ArduinoCreateAgent-1.1-linux-x64-installer.run --mode unattended --installer-language pt_BR',
			#creates => '/home/root/ArduinoCreateAgent-1.1/config.ini',
			require => [
				#File['ArduinoCreateAgent-1.1'],
				Package['libappindicator3-1'],
			],
			#creates => '/usr/local/ArduinoCreateAgent-1.1/certificate.crt',
			# refreshonly => true,
		}

	# file { 'certificate.crt':
	# 	path => '/usr/local/share/ca-certificates/certificate.crt',
	# 	ensure => file,
	# 	source => 'puppet:///modules/arduino_web_plugin/ArduinoCreateAgent-1.1/certificate.crt',
	# 	owner => root,
	# 	group => staff,
	# 	mode => 0644,
	# }
	#
	# file { 'createAgentLocal.crt':
	# 	path => '/usr/local/share/ca-certificates/createAgentLocal.crt',
	# 	ensure => file,
	# 	source => 'puppet:///modules/arduino_web_plugin/ArduinoCreateAgent-1.1/certificate.crt',
	# 	owner => root,
	# 	group => staff,
	# 	mode => 0644,
	# }
}
