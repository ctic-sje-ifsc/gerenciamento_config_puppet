class kdenlive17 {

  file {'kdenlive17':
    path => 'C:\Program Files\Kdenlive-17.04.3',
    ensure => directory,
    recurse => true,
    mode => '0777',
    source => 'puppet:///modules/kdenlive17/kdenlive17.04.3',
    source_permissions => ignore,
  }


  #exec { 'muda_permissao_ISP':
  #			command => '$Acl= Get-Acl "C:\Program Files\ISP\progisp172" ; $Ar = New-Object  system.security.accesscontrol.filesystemaccessrule("aluno","FullControl", "ContainerInherit,ObjectInherit", "None","Allow") ; $Acl.SetAccessRule($Ar) ; Set-Acl "C:\Program Files\ISP\progisp172" $Acl',
  #			provider => powershell,
  #      require => File ['progisp'],
  #    }
  }
