class progslabredes2 {

    #Programas lab de programacao
    $list = [ "python3", "ipython3", "g++","spyder3", "gcc-avr", "gcc-arm-none-eabi"]

    package { $list:
        ensure => installed,
    }

}
