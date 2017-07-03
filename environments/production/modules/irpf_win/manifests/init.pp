class irpf_win {
  file {'IRPF2016':
    path => 'C:\Program Files\IRPF2016Win32v1.1.exe',
    ensure => file,
    source => 'puppet:///modules/irpf_win/IRPF2016Win32v1.1.exe',
    source_permissions => ignore,
}

  file {'receitanet':
    path => 'C:\Program Files\Receitanet-1.07.exe',
    ensure => file,
    source => 'puppet:///modules/irpf_win/Receitanet-1.07.exe',
    source_permissions => ignore,
  }
  exec { 'instala_irpf':
         command => 'Start-Process -FilePath "C:\Program Files\IRPF2016Win32v1.1.exe" -ArgumentList "/mode silent"',
         provider => powershell,
         require => File ['IRPF2016'],
         creates => 'C:\Arquivos de Programas RFB\IRPF2016',
  }
  exec { 'instala_receitanet':
         command => 'Start-Process -FilePath "C:\Program Files\Receitanet-1.07.exe" -ArgumentList "/mode silent"',
         provider => powershell,
         require => File ['receitanet', 'IRPF2016'],
         creates => 'C:\Program Files\Programas RFB\Receitanet',
  }

  file {'icone_desktop_irpf2016':
    path => 'C:\Users\Public\Desktop\IRPF2016.lnk',
    ensure => file,
    source => 'puppet:///modules/irpf_win/IRPF2016.lnk',
    source_permissions => ignore,
  }



}
