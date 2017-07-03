class erre {
  file {'R':
    path => 'C:\Program Files\R-3.2.4.exe',
    ensure => file,
    source => 'puppet:///modules/erre/R-3.2.4.exe',
    source_permissions => ignore,
  }
  exec { 'instala_erre':
         command => 'Start-Process -FilePath "C:\Program Files\R-3.2.4.exe" -ArgumentList "/VERYSILENT" ',
         provider => powershell,
         require => File ['R'],
         creates => 'C:\Program Files\R',
  }
}
