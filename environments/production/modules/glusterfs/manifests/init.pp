class glusterfs {

    exec { 'install_gluster':
        command => "/usr/bin/wget -O - http://download.gluster.org/pub/gluster/glusterfs/3.9/rsa.pub | /usr/bin/apt-key add - ; /bin/echo deb http://download.gluster.org/pub/gluster/glusterfs/3.9/LATEST/Debian/jessie/apt jessie main > /etc/apt/sources.list.d/gluster.list ; /usr/bin/apt-get update ; /usr/bin/touch /var/gatilho_install_gluster",
        creates => "/var/gatilho_install_gluster",
        require => Package['apt-transport-https'],
    }

    package { 'glusterfs-server':
        ensure => latest,
        require => exec['install_gluster'],
    }

}
