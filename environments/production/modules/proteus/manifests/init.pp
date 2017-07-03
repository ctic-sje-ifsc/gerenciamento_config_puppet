### A instalacao nao eh toda automatica
### trava se deixar executar o puppet automaticamente
### rodar por linha de comando vai pedir interacao clique em avancar
### Adicionar licenca na mao

class proteus {
  file {'proteus8':
    path => 'C:\Program Files (x86)\proteus8.0.SP3.exe',
    ensure => file,
    source => 'puppet:///modules/proteus/proteus8.0.SP3.exe',
    source_permissions => ignore,
  }
  file {'licence':
    path => 'C:\Program Files (x86)\Labcenter Electronics\Proteus 8 Professional\LICENCE\licence.lxk',
    ensure => file,
    source => 'puppet:///modules/proteus/licence.lxk',
    source_permissions => ignore,
  }
  exec { 'instala_proteus8':
         command => 'Start-Process -FilePath "C:\Program Files (x86)\proteus8.0.SP3.exe" -ArgumentList "/qn" -wait',
         provider => powershell,
         require => File ['proteus8'],
         creates => 'C:\Program Files (x86)\Labcenter Electronics',
  }
}
