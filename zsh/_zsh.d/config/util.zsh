function setJapaneseTime {
    sudo ntpdate clock.nc.fukuoka-u.ac.jp
    sudo hwclock --systohc
}

