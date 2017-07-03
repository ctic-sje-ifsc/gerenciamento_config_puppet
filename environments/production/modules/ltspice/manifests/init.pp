class ltspice {

  file { 'ltspice17':
    path => 'C:\Program Files\LTC',
    ensure => file,
    recurse => true,
    source => 'puppet:///modules/ltspice/LTC',
    source_permissions => ignore,
  }

  file {'icone_desktop_ltspice':
    path => 'C:\Users\Public\Desktop\LTspiceXVII.lnk',
    ensure => file,
    source => 'puppet:///modules/ltspice/LTC/LTspiceXVII.lnk',
    source_permissions => ignore,
  }

}
