class sketchup {
   
   package { 'vcredist140':
     ensure   => installed,
     provider => 'chocolatey',
   }

   package { 'sketchup':
     ensure   => installed,
     install_options => ['--ignore-checksums'],
     provider => 'chocolatey',
     require => Package['vcredist140']
   }
}
