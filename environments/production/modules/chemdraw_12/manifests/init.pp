class chemdraw_12 {

  ############# INSTALAÇÃO MANUAL ################

  file {'chemdraw.bz':
    path          => 'C:\Windows\Temp\chemdraw.bz',
    ensure        => file,
    source        => 'puppet:///modules/chemdraw_12/chemdraw.bz',
    source_permissions => ignore,
  }

  archive { 'C:\Windows\Temp\chemdraw.bz':
    ensure        => present,
    extract       => true,
    extract_command => 'tar xfj %s',
    extract_path  => 'C:\Windows\Temp',
    source        => 'puppet:///modules/chemdraw_12/chemdraw.bz',
    creates       => 'C:\Users\Public\Desktop\Chem3D Pro 12.0.lnk',
    cleanup       => true,
    require       => File ['chemdraw.bz'],
  }

  file {'serial_chemdraw12':
    path          => 'C:\Windows\Temp\serial_chemdraw12.txt',
    ensure        => file,
    source        => 'puppet:///modules/chemdraw_12/serial.txt',
    source_permissions => ignore,
  }

  file {'icone_desktop_chemdraw':
    path => 'C:\Users\Public\Desktop\Chem3D Pro 12.0.lnk',
    ensure => file,
    source => 'puppet:///modules/chemdraw_12/Chem3D Pro 12.0.lnk',
    source_permissions => ignore,
  }

  exec { 'instala_chemdraw':
    command       => 'Start-Process -FilePath "C:\Windows\Temp\chemdraw12\Cambridgesoft\ChemOffice\CambridgeSoft_ChemDraw_Ultra_12.0.msi" -ArgumentList "/qb"',
    provider      => powershell,
    require       => File ['chemdraw.bz'],
    creates       => 'C:\Program Files (x86)\CambridgeSoft',
  }
}
