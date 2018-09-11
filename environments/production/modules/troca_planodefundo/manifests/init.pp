class troca_planodefundo {

  if $::kernel == windows {
      file {'win_fundo_ifsc_sj.jpg':
        path => 'C:\Users\fundo_ifsc_sj.jpg',
        ensure => file,
        source => 'puppet:///modules/troca_planodefundo/fundo_ifsc_sj.jpg',
        source_permissions => ignore,
      }
  }else{
    if $lsbdistcodename == trusty {
          file { 'lin_fundo_ifsc_sj.jpg':
                  path => '/home/imagens/fundo_ifsc_sj.jpg',
                  ensure => file,
                  source => 'puppet:///modules/troca_planodefundo/fundo_ifsc_sj.jpg',
                  owner => root,
                  group => root,
                  mode => 0755,
          }
    }

    if $lsbdistcodename == jessie {
          file { 'lin_fundo_ifsc_sj.jpg':
                  path => '/home/fundo_ifsc_sj.jpg',
                  ensure => file,
                  source => 'puppet:///modules/troca_planodefundo/fundo_ifsc_sj.jpg',
                  owner => root,
                  group => root,
                  mode => 0755,
          }

          file { 'trocaplanodefundo.sh':
                  path => '/etc/profile.d/trocaplanodefundo.sh',
                  ensure => file,
                  source => 'puppet:///modules/troca_planodefundo/trocaplanodefundo.sh',
                  owner => root,
                  group => root,
                  mode => 0755,
                  require => file['lin_fundo_ifsc_sj.jpg'],
          }
        
    }
  }
}
