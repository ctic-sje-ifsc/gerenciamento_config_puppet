class bricscad {

	file {'bricscad_msi':
    path => 'C:\Program Files\BricsCAD-V18.2.14-1.msi',
    ensure => file,
    source => 'puppet:///modules/bricscad/BricsCAD-V18.2.14-1.msi',
    source_permissions => ignore,
  }

	exec { 'instala_bricscad_msi':
        command => 'msiexec /i "C:\Program Files\BricsCAD-V18.2.14-1.msi" /qn BRXLICENSESERVER="dko" SHOWRELEASENOTES=""',
        provider => powershell,
        require => File ['bricscad_msi'],
        creates => 'C:\Program Files\Bricsys',
  }



}
