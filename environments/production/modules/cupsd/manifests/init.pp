class cupsd {

  $list = [ "printer-driver-gutenprint", "cups-core-drivers", "cups", "libcups2" ]

  package { $list:
    ensure => latest,
  }

  case $hostname {
    /^sj-lin-biblio-ligia/: {
        $printers_conf = 'puppet:///modules/cupsd/biblio.imp.local.printers.conf'
        file { 'printers.conf':
          path => '/etc/cups/printers.conf',
          ensure => file,
          source => $printers_conf,
          owner => root,
          group => lp,
          mode => 0600,
        }
        file { 'cups-browsed.conf':
          path => '/etc/cups/cups-browsed.conf',
          ensure => file,
          source => 'puppet:///modules/cupsd/cups-browsed.conf',
          owner => root,
          group => root,
          mode => 0644,
        }
        file { 'rm_client.conf':
      		path => '/etc/cups/client.conf',
      		ensure => absent,
      	}
        file { 'savpdf':
          path => '/usr/local/bin/savpdf',
          ensure => file,
          source => 'puppet:///modules/cupsd/savpdf',
          owner => root,
          group => root,
          mode => 0755,
        }
        file { 'run_savpdf':
          path => '/etc/profile.d/run_savpdf',
          ensure => file,
          source => 'puppet:///modules/cupsd/run_savpdf',
          owner => root,
          group => root,
          mode => 0644,
        }
        package { 'cups-pdf':
          ensure => latest,
        }
        file { 'cups-pdf.conf':
          path => '/etc/cups/cups-pdf.conf',
          ensure => file,
          source => 'puppet:///modules/cupsd/cups-pdf.conf',
          owner => root,
          group => root,
          mode => 0644,
        }        
        service { 'cups':
          ensure => running,
          enable => true,
          subscribe => [
            File['printers.conf'],
            File['rm_client.conf'],
          ],
          require => Package[$list],
        }
    }
    /^sj-lin-biblio/: {
        if ($hostname !~ /^sj-lin-biblio-ligia/) {
          $printers_conf = 'puppet:///modules/cupsd/biblio.imp.remote.printers.conf'
          file { 'printers.conf':
            path => '/etc/cups/printers.conf',
            ensure => file,
            source => $printers_conf,
            owner => root,
            group => lp,
            mode => 0600,
          }
          file { 'cups-browsed.conf':
            path => '/etc/cups/cups-browsed.conf',
            ensure => file,
            source => 'puppet:///modules/cupsd/cups-browsed.conf',
            owner => root,
            group => root,
            mode => 0644,
          }
          file { 'rm_client.conf':
      		  path => '/etc/cups/client.conf',
      		    ensure => absent,
      	  }
          service { 'cups':
            ensure => running,
            enable => true,
            subscribe => [
              File['printers.conf'],
              File['rm_client.conf'],
            ],
            require => Package[$list],
          }
          file { 'savpdf':
            path => '/usr/local/bin/savpdf',
            ensure => file,
            source => 'puppet:///modules/cupsd/savpdf',
            owner => root,
            group => root,
            mode => 0755,
          }
          file { 'run_savpdf':
            path => '/etc/profile.d/run_savpdf',
            ensure => file,
            source => 'puppet:///modules/cupsd/run_savpdf',
            owner => root,
            group => root,
            mode => 0644,
          }
          package { 'cups-pdf':
            ensure => latest,
          }
          file { 'cups-pdf.conf':
            path => '/etc/cups/cups-pdf.conf',
            ensure => file,
            source => 'puppet:///modules/cupsd/cups-pdf.conf',
            owner => root,
            group => root,
            mode => 0644,
          }
        }
    }
    /^sj-lin-bal-biblio/: {
        if ($hostname !~ /^sj-lin-biblio-ligia/) {
          $printers_conf = 'puppet:///modules/cupsd/biblio.imp.remote.printers.conf'
          file { 'printers.conf':
            path => '/etc/cups/printers.conf',
            ensure => file,
            source => $printers_conf,
            owner => root,
            group => lp,
            mode => 0600,
          }
          file { 'cups-browsed.conf':
            path => '/etc/cups/cups-browsed.conf',
            ensure => file,
            source => 'puppet:///modules/cupsd/cups-browsed.conf',
            owner => root,
            group => root,
            mode => 0644,
          }
          file { 'rm_client.conf':
              path => '/etc/cups/client.conf',
                ensure => absent,
          }
          service { 'cups':
            ensure => running,
            enable => true,
            subscribe => [
              File['printers.conf'],
              File['rm_client.conf'],
            ],
            require => Package[$list],
          }
        }
    }
    /^sj-lin-comaf/: {
        $printers_conf = 'puppet:///modules/cupsd/comaf.printers.conf'
          file { 'printers.conf':
            path => '/etc/cups/printers.conf',
            ensure => file,
            source => $printers_conf,
            owner => root,
            group => lp,
            mode => 0600,
          }
          file { 'cups-pdf.conf':
            path => '/etc/cups/cups-pdf.conf',
            ensure => file,
            source => 'puppet:///modules/cupsd/cups-pdf.conf',
            owner => root,
            group => root,
            mode => 0644,
          }
          file { 'savpdf':
            path => '/usr/local/bin/savpdf',
            ensure => file,
            source => 'puppet:///modules/cupsd/savpdf',
            owner => root,
            group => root,
            mode => 0755,
          }
          file { 'run_savpdf':
            path => '/etc/profile.d/run_savpdf',
            ensure => file,
            source => 'puppet:///modules/cupsd/run_savpdf',
            owner => root,
            group => root,
            mode => 0644,
          }
          file { 'cups-browsed.conf':
            path => '/etc/cups/cups-browsed.conf',
            ensure => file,
            source => 'puppet:///modules/cupsd/cups-browsed.conf',
            owner => root,
            group => root,
            mode => 0644,
          }
/*          file { 'savpdf.desktop':
            path => '/etc/xdg/autostart/savpdf.desktop',
            ensure => file,
            source => 'puppet:///modules/cupsd/savpdf.desktop',
            owner => root,
            group => root,
            mode => 0644,
          }
          file { '1savpdf.desktop':
            path => '/usr/share/applications/savpdf.desktop',
            ensure => file,
            source => 'puppet:///modules/cupsd/savpdf.desktop',
            owner => root,
            group => root,
            mode => 0644,
          }
*/
          file { 'rm_client.conf':
            path => '/etc/cups/client.conf',
              ensure => absent,
          }
          service { 'cups':
            ensure => running,
            enable => true,
            subscribe => [
              File['printers.conf'],
              File['rm_client.conf'],
            ],
            require => Package[$list],
          }
          package { 'cups-pdf':
            ensure => latest,
          }
    }
    /^sj-lin-cotur-38121/: {
        $printers_conf = 'puppet:///modules/cupsd/cotur.imp.local.printers.conf'
          file { 'printers.conf':
            path => '/etc/cups/printers.conf',
            ensure => file,
            source => $printers_conf,
            owner => root,
            group => lp,
            mode => 0600,
          }
          file { 'cups-browsed.conf':
            path => '/etc/cups/cups-browsed.conf',
            ensure => file,
            source => 'puppet:///modules/cupsd/cups-browsed.conf',
            owner => root,
            group => root,
            mode => 0644,
          }
          file { 'rm_client.conf':
            path => '/etc/cups/client.conf',
              ensure => absent,
          }
          service { 'cups':
            ensure => running,
            enable => true,
            subscribe => [
              File['printers.conf'],
              File['rm_client.conf'],
            ],
            require => Package[$list],
          }
    }

	/^sj-lin-almox-756044/: {
        $printers_conf = 'puppet:///modules/cupsd/almox.imp.local.printers.conf'
          file { 'printers.conf':
            path => '/etc/cups/printers.conf',
            ensure => file,
            source => $printers_conf,
            owner => root,
            group => lp,
            mode => 0600,
          }
          file { 'cups-browsed.conf':
            path => '/etc/cups/cups-browsed.conf',
            ensure => file,
            source => 'puppet:///modules/cupsd/cups-browsed.conf',
            owner => root,
            group => root,
            mode => 0644,
          }
          file { 'rm_client.conf':
            path => '/etc/cups/client.conf',
              ensure => absent,
          }
          service { 'cups':
            ensure => running,
            enable => true,
            subscribe => [
              File['printers.conf'],
              File['rm_client.conf'],
            ],
            require => Package[$list],
          }
    }


    default: {

        file { 'client.conf':
    		path => '/etc/cups/client.conf',
    		ensure => file,
    		source => 'puppet:///modules/cupsd/client.conf',
    		owner => root,
    		group => root,
    		mode => 0644,
    	  }
        file { 'cups-browsed.conf':
          path => '/etc/cups/cups-browsed.conf',
          ensure => file,
          source => 'puppet:///modules/cupsd/cups-browsed.conf',
          owner => root,
          group => root,
          mode => 0644,
        }
        service { 'cups':
          ensure => stopped,
          enable => false,
          subscribe => [
            File['client.conf'],
          ],
          require => Package[$list],
        }
    }
  }

/*   file { 'banner_ifsc':
     path => '/usr/share/cups/banners/ifsc',
     ensure => file,
     source => 'puppet:///modules/cupsd/ifsc',
     owner => root,
     group => root,
     mode => 0644,
     }
*/

}
