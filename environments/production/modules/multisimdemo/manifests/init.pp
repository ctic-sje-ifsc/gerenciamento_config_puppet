class multisimdemo {



  ########################### Instalacao manual
  file {'msm':
    path => 'C:\Program Files\msmdemo.exe',
    ensure => file,
    source => 'puppet:///modules/multisimdemo/msmdemo.exe',
    source_permissions => ignore,
  }
  exec { 'instala_dao':
        command => 'Start-Process -FilePath "C:\Program Files\msmdemo.exe" -ArgumentList "/qn" -wait ',
        provider => powershell,
        require => File ['msm'],
        creates => 'C:\msmdemo',
  }
  file {'pasta_msm':
    path => 'C:\msmdemo',
    ensure => file,
    recurse => true,
    source => 'puppet:///modules/multisimdemo/msmdemo',
    source_permissions => ignore,
  }
  file {'icone_desktop_msm':
    path => 'C:\Users\Public\Desktop\Multisim 2001 Demo.lnk',
    ensure => file,
    source => 'puppet:///modules/multisimdemo/msm.lnk',
    require => File ['pasta_msm'],
    source_permissions => ignore,
  }
  exec { 'muda_permissao':
  			command => '$Acl= Get-Acl "C:\Msmdemo" ; $Ar = New-Object  system.security.accesscontrol.filesystemaccessrule("aluno","FullControl", "ContainerInherit,ObjectInherit", "None","Allow") ; $Acl.SetAccessRule($Ar) ; Set-Acl "C:\Msmdemo" $Acl',
  			provider => powershell,
        require => File ['pasta_msm'],
  }
}
