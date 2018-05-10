class rstudio {


	package { 'r-base': ensure => 'latest' }
  package { 'libjpeg62': ensure => 'latest' }
	package { 'r-cran-rjava': ensure => 'latest' }

	file { 'rstudio-1.1.447-amd64.deb':
		path => '/usr/local/src/rstudio-1.1.447-amd64.deb',
		owner => root,
		group => root,
		mode => 0644,
		source => 'puppet:///modules/rstudio/rstudio-1.1.447-amd64.deb',
	}
	exec { 'link_java_to_r':
		command => '/bin/ln -s /usr/lib/jvm/java-8-openjdk-amd64/ /usr/lib/jvm/default-java; R CMD javareconf',
		timeout => 0,
		require => [
			package['r-cran-rjava'],
		],
	}

	exec { 'dpkg:rstudio-1.1.447-amd64.deb':
		command => "/usr/bin/dpkg -i /usr/local/src/rstudio-1.1.447-amd64.deb",
		subscribe => File['rstudio-1.1.447-amd64.deb'],
		refreshonly => true,
		require => [
			package['r-base'],
			package['libjpeg62'],
		],
	}


}
