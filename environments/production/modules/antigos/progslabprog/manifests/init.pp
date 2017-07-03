class progslabprog {
    #Programas lab de programacao
    $list = [ "okular", "x2goclient", "g++", "gcc-avr", "gcc-arm-none-eabi"]

    package { $list:
        ensure => installed,
    }

}
