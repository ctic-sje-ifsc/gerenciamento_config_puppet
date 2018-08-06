class rstudio {

	exec { 'add_key_r-base':
		command => "/usr/bin/gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9  ; /usr/bin/gpg -a --export E084DAB9 | sudo apt-key add - ; /bin/touch /var/gatinho_key_r-base",
		creates => "/var/gatinho_key_r-base";
	}

	exec { 'apt-get-update_r-base':
		command => "/usr/bin/apt-get update",
	}

	package { 'r-base': ensure => 'latest', install_options => ['--force-yes'], require => exec[apt-get-update_r-base], }
  package { 'libjpeg62': ensure => 'latest', install_options => ['--force-yes'], require => exec[apt-get-update_r-base], }
	package { 'r-cran-rjava': ensure => 'latest', install_options => ['--force-yes'], require => exec[apt-get-update_r-base], }

	file { 'rstudio-1.1.447-amd64.deb':
		path => '/usr/local/src/rstudio-1.1.447-amd64.deb',
		owner => root,
		group => root,
		mode => 0644,
		source => 'puppet:///modules/rstudio/rstudio-1.1.447-amd64.deb',
	}

/*#Comentado a pedido do Noronha
	exec { 'link_java_to_r':
		command => '/bin/rm -rf /usr/lib/jvm/default-java;/bin/ln -s /usr/lib/jvm/java-8-openjdk-amd64/ /usr/lib/jvm/default-java; /usr/bin/R CMD javareconf',
		timeout => 0,
		require => [
			package['r-cran-rjava'],
		],
	}
*/

	exec { 'dpkg:rstudio-1.1.447-amd64.deb':
		command => "/usr/bin/dpkg -i /usr/local/src/rstudio-1.1.447-amd64.deb",
		subscribe => File['rstudio-1.1.447-amd64.deb'],
		refreshonly => true,
		require => [
			package['r-base'],
			package['libjpeg62'],
		],
	}

	##### BIBLIOTECAS #####
	exec { 'RWekajars_3.9.2-1.tar.gz':
		command => '/usr/bin/wget https://cran.r-project.org/src/contrib/RWekajars_3.9.2-1.tar.gz -O /tmp/file.tar.gz; /usr/bin/R CMD INSTALL /tmp/file.tar.gz',
		timeout => 0,
		creates => "/usr/local/lib/R/site-library/RWekajars",
	}

	exec { 'RWeka_0.4-38.tar.gz':
		command => '/usr/bin/wget https://cran.r-project.org/src/contrib/RWeka_0.4-38.tar.gz -O /tmp/file.tar.gz; /usr/bin/R CMD INSTALL /tmp/file.tar.gz',
		timeout => 0,
		creates => "/usr/local/lib/R/site-library/RWeka",
		require => [
			exec['RWekajars_3.9.2-1.tar.gz'],
		],
	}
	exec { 'gdata_2.18.0.tar.gz':
		command => '/usr/bin/wget https://cran.r-project.org/src/contrib/gdata_2.18.0.tar.gz -O /tmp/file.tar.gz; /usr/bin/R CMD INSTALL /tmp/file.tar.gz',
		timeout => 0,
		creates => "/usr/local/lib/R/site-library/gdata",
		require => [
			exec['gtools_3.8.1.tar.gz'],
		],
	}
	exec { 'gmodels_2.18.1.tar.gz':
		command => '/usr/bin/wget https://cran.r-project.org/src/contrib/gmodels_2.18.1.tar.gz -O /tmp/file.tar.gz; /usr/bin/R CMD INSTALL /tmp/file.tar.gz',
		timeout => 0,
		creates => "/usr/local/lib/R/site-library/gmodels",
		require => [
			exec['gdata_2.18.0.tar.gz'],
		],
	}
	exec { 'gtools_3.8.1.tar.gz':
		command => '/usr/bin/wget https://cran.r-project.org/src/contrib/gtools_3.8.1.tar.gz -O /tmp/file.tar.gz; /usr/bin/R CMD INSTALL /tmp/file.tar.gz',
		timeout => 0,
		creates => "/usr/local/lib/R/site-library/gtools",
	}
}
