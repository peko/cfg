Интернет
    
    wifi

    > wifi-menu

    ethernet
    
    > dhcpcd

workman

http://github.com/peko/workman-layout
http://github.com/peko/cfg

    > elinks
    > loadkeys workman

Разбиваем жесткий диск, делаем загрузочным раздел

    > cfdisk
      
      sda1 / bootable (type 83)
      sda2 swap       (type 82) 

Созадем файловую систему

    > mkfs.ext4 /dev/sda1  
    > mkswap /dev/sda2
    > swapon /dev/sda2

Монтируем раздел, заливаем базовую структуру

    > mount /dev/sda1 /mnt
    > mkdir /mnt/boot
    > mkdir /mnt/home
    > pacstrap /mnt base base-devel

Прописываем разметку жесткого диска

    > genfstab -p /mnt > /mnt/etc/fstab

Проверяем что основнои раздел и своп прописались

    > cat /mnt/etc/fstab

      /dev/sda1  /     ext4  rw,relatime,data=ordered    0 1
      /dev/sda2  none  swap  defaults                    0 0

Заходим под установленную ситему

    > arch-chroot /mnt

Устанавливаем host
    
    > echo arch > /etc/hostname

Устанавливаем таймзону

    > cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime

Генерируем локаль

    > locale-gen

Создаем рамдиск с образами

    > mkinitcpio -p linux

Устанавливаем пароль руту
    
    > passwd

Ставим пекеджи с grub и wifi тулзами
    
    > pacman -S grub dialog wpa_supplicant

Устанавливаем grub

    > grub-install /dev/sda
    > grub-mkconfig -o /boot/grub/grub.cfg

vt workman
    
    > cp workman-arch.map /usr/share/kbd/keymaps/i386
    > vim /etc/vconsole.conf
      KEYMAP=workman-arch
      FONT=Cyr_a8x14

Выходим, размонтируемся

    > exit
    > sync; umount -R /mnt
    > reboot
    
After reboot

Setup locale

    List
    
    > localectl list-locales
    
    Set
    
    > localectl set-locale LANG=ru_RU.UTF-8
    
    or
    
    > echo "LANG=ru_RU.UTF-8" > /etc/locale.conf 

workman

vt

    > cp workman-arch.map /usr/share/kbd/keymaps/i386
    # ls /usr/share/kbd/consolefonts
    # showconsoefont
    # setfont Cyr_a8x14
    > vim /etc/vconsole.conf
      KEYMAP=workman-arch
      FONT=Cyr_a8x14 

X11

    cat > /etc/X11/xorg.conf.d/00.keyboard.conf 

Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us"
        Option "XkbModel" "pc104"
        Option "XkbVariant" "workman"
EndSection
ctrl+d

Звук

    > pacman -S alsa-utils pulseaudio mocp
    > alsamixer (unmute)
    > speaker-test
    
Прочее

  > pacman -S zsh mc tmux vim

