class chemdraw_12 {
  file {'CambridgeSoft':
    path => 'C:\Program Files (x86)\CambridgeSoft',
    ensure => file,
    recurse => true,
    source => 'puppet:///modules/chemdraw_12/CambridgeSoft',
    source_permissions => ignore,
}

  file {'icone_desktop_chemdraw':
    path => 'C:\Users\Public\Desktop\Chem3D Pro 12.0.lnk',
    ensure => file,
    source => 'puppet:///modules/chemdraw_12/Chem3D Pro 12.0.lnk',
    source_permissions => ignore,
    require => File ['CambridgeSoft'],
  }

############# NÃO ESTÁ FUNCIONANDO AINDA ################

}
