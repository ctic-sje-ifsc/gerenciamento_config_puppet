class ultravnc_win {
  package { 'ultravnc':
    ensure   => '1.2060',
    provider => 'chocolatey',
    require => File ['UltraVNC.ini'],
  }
  file {'uvnc_bvba':
    path => 'C:\Program Files\uvnc bvba',
    ensure => directory,
    source_permissions => ignore,
  }
  file {'ultravnc':
    path => 'C:\Program Files\uvnc bvba\UltraVnc',
    ensure => directory,
    source_permissions => ignore,
    require => File ['uvnc_bvba'],
  }
  file {'UltraVNC.ini':
    path => 'C:\Program Files\uvnc bvba\UltraVnc\UltraVNC.ini',
    ensure => file,
    source => 'puppet:///modules/ultravnc_win/UltraVNC.ini',
    source_permissions => ignore,
    require => [ File ['ultravnc'], exec ['libera_firewall'] ],
  }
  exec { 'libera_firewall':
         command => "netsh advfirewall firewall add rule name='OpenVNC' dir=in action=allow protocol=TCP localport=5900",
         provider => powershell,
         creates => 'C:\Program Files\uvnc bvba\UltraVnc\UltraVNC.ini',
  }

}
