class winscp5 {
  file {'winscp5':
    path => 'C:\Program Files (x86)\winscp5.exe',
    ensure => file,
    source => 'puppet:///modules/winscp5/winscp5.exe',
    source_permissions => ignore,
  }
  exec { 'instala_winscp5':
         command => 'Start-Process -FilePath "C:\Program Files (x86)\winscp5.exe" -ArgumentList "/VERYSILENT" ',
         provider => powershell,
         require => File ['winscp5'],
         creates => 'C:\Program Files (x86)\WinSCP',
  }
}
