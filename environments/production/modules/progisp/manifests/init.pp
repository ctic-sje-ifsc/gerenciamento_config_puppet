class progisp {

  file {'progisp':
    path => 'C:\Program Files\ISP',
    ensure => directory,
    recurse => true,
    mode => '0777',
    source => 'puppet:///modules/progisp/ISP',
    source_permissions => ignore,
  }


  #exec { 'muda_permissao_ISP':
  #			command => '$Acl= Get-Acl "C:\Program Files\ISP\progisp172" ; $Ar = New-Object  system.security.accesscontrol.filesystemaccessrule("aluno","FullControl", "ContainerInherit,ObjectInherit", "None","Allow") ; $Acl.SetAccessRule($Ar) ; Set-Acl "C:\Program Files\ISP\progisp172" $Acl',
  #			provider => powershell,
  #      require => File ['progisp'],
  #    }
  }
