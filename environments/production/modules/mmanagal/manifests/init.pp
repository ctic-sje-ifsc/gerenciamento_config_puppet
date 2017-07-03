class mmanagal {
  file {'mmana':
    path => 'C:\Program Files\mmanagal.exe',
    ensure => file,
    source => 'puppet:///modules/mmanagal/mmanagal.exe',
    source_permissions => ignore,
  }
  exec { 'instala_mmanagal':
         command => 'Start-Process -FilePath "C:\Program Files\mmanagal.exe" -ArgumentList "/VERYSILENT" ',
         provider => powershell,
         require => File ['mmana'],
         creates => 'C:\MMana-GAL_Basic',
  }
  file {'icone_desktop_mmanagal':
    path => 'C:\Users\Public\Desktop\MMANA-GAL_Basic.lnk',
    ensure => file,
    source => 'puppet:///modules/mmanagal/MMANA-GAL_Basic.lnk',
    source_permissions => ignore,
  }
}
