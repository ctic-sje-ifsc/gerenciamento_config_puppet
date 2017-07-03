class sr2015 {
  file {'sr':
    path => 'C:\Program Files\sr2015.exe',
    ensure => file,
    source => 'puppet:///modules/sr2015/sr2015.exe',
    source_permissions => ignore,
  }
  exec { 'instala_sr':
         command => 'Start-Process -FilePath "C:\Program Files\sr2015.exe" -ArgumentList "/VERYSILENT" ',
         provider => powershell,
         require => File ['sr'],
         creates => 'C:\Program Files (x86)\SR 2015',
  }
  file {'icone_desktop_sr2015':
    path => 'C:\Users\Public\Desktop\SR2015.lnk',
    ensure => file,
    source => 'puppet:///modules/sr2015/SR2015.lnk',
    source_permissions => ignore,
  }
}
