class banco {
#  file {'warsaw':
#    path => 'C:\Program Files\warsaw_setup.exe',
#    ensure => file,
#    source => 'puppet:///modules/banco/warsaw_setup.exe',
#    source_permissions => ignore,
#}
#  exec { 'instala_warsaw':
#         command => 'Start-Process -FilePath "C:\Program Files\warsaw_setup.exe" -ArgumentList "/s, /v\'"/qn\'"" -wait',
#         provider => powershell,
#         require => File ['warsaw'],
#         creates => 'C:\Program Files\warsaw_setup.exe',
#  }
### EXEMPLO BAIXAR WINDOWS, nao sei se funciona
# command => 'Invoke-WebRequest http://download.geteventstore.com/binaries/EventStore-OSS-Win-v3.0.0-rc9.zip -OutFile c:\\downloads\\EventStore-OSS-Win-v3.0.0-rc9.zip',

if $::kernel == windows {
  file {'bb':
    path => 'C:\Program Files\DiagnosticoBB.exe',
    ensure => file,
    source => 'puppet:///modules/banco/DiagnosticoBB.exe',
    source_permissions => ignore,
  }
  exec { 'instala_bb':
        command => 'Start-Process -FilePath "C:\Program Files\DiagnosticoBB.exe" -ArgumentList "/qn" -wait',
        provider => powershell,
        require => File ['bb'],
        creates => 'C:\Program Files\Diebold',
  }

  file {'caixa':
    path => 'C:\Program Files\iGBPCEFwr.exe',
    ensure => file,
    source => 'puppet:///modules/banco/iGBPCEFwr.exe',
    source_permissions => ignore,
  }
  exec { 'instala_caixa':
        command => 'Start-Process -FilePath "C:\Program Files\iGBPCEFwr" -ArgumentList "/s, /v\'"/qn\'"" -wait',
        provider => powershell,
        require => File ['caixa', 'bb'],
        creates => 'C:\Program Files\Diebold',
  }
}

#### PARAMOS POIS ELE PEDE INTERCAO E QUE O NAVEGADOR ESTEJA FECHADO, TAMBEM TEM QUE DAR VARIOS ENTER PQ PEDE SENHA DO PAM_MOUNT

if $lsbdistcodename == jessie {


  $list = [ "libnss3-tools"]
        package { $list:
        ensure => latest,
  }
  file {'GBPCEFwr64':
    path => '/var/GBPCEFwr64.deb',
    ensure => file,
    source => 'puppet:///modules/banco/GBPCEFwr64.deb',
    source_permissions => ignore,
  }
  exec { 'wget_banco':
    #command => "/usr/bin/wget -O /var/GBPCEFwr64.deb  https://cloud.gastecnologia.com.br/cef/warsaw/install/GBPCEFwr64.deb; /usr/bin/gdebi --n /var/GBPCEFwr64.deb",
    require => File ['GBPCEFwr64'],
    command => "/usr/bin/gdebi --n /var/GBPCEFwr64.deb",
    creates => '/usr/local/bin/warsaw/core',
  }
###############
  #exec { 'instala_caixa':
  #      command => 'Start-Process -FilePath "C:\Program Files\iGBPCEFwr" -ArgumentList "/s, /v\'"/qn\'"" -wait',
  #      provider => powershell,
  #      require => File ['caixa', 'bb'],
  #      creates => 'C:\Program Files\Diebold',
  #}

}


}
