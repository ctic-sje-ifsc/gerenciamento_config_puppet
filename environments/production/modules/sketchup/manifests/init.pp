class sketchup {
   
   package { 'vcredist140':
     ensure   => installed,
     provider => 'chocolatey',
   }

   package { 'sketchup':
     ensure   => absent,
     install_options => ['--ignore-checksums'],
     provider => 'chocolatey',
     require => Package['vcredist140']
   }

  file {'sketchup_installer':
    path => 'C:\Program Files\SketchUp2017-x64.msi',
    ensure => file,
    source => 'puppet:///modules/sketchup/SketchUp2017-x64.msi',
    source_permissions => ignore,
  }

  exec { 'instala_sketchup':
    command => "msiexec /i 'C:\Program Files\SketchUp2017-x64.msi' /qn",
    provider => powershell,
    require => [ File['sketchup_installer'], Package['vcredist140'],],
    creates => 'C:\Program Files\SketchUp',
  }
}
