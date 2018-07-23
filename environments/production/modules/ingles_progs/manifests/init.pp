class ingles_progs {

package { gnome-subtitles:
	ensure => latest,
}

archive { '/tmp/antconc.tar.gz':
	ensure        => present,
	extract       => true,
	extract_command => 'tar xfz %s',
	extract_path  => '/opt/antconc',
	source        => 'http://www.laurenceanthony.net/software/antconc/releases/AntConc357/AntConc_64bit.tar.gz',
	creates       => '/opt/antconc/AntConc_64bit',
	cleanup       => true,
	user          => aluno,
	group         => aluno,
	require       => File['/opt/antconc'],
}

file { '/opt/antconc':
	path => '/opt/antconc',
	ensure => directory,
	owner => aluno,
	group => aluno,
	mode => 0755,
}

file { 'antconc.desktop':
	path => '/usr/share/applications/antconc.desktop',
	ensure => file,
	source => 'puppet:///modules/ingles_progs/antconc.desktop',
	owner => root,
	group => root,
	mode => 0644,
}




}
