#!/bin/sh

user=$1
hostname=$2

if [ $(hostname) = $hostname ]
then
    echo "Configurazione in corso"
    chsh -s /bin/rbash $user
    mkdir /home/$user/bin
    chmod 755 /home/$user/bin
    ln -s /bin/vi /home/$user/bin/
    echo 'PATH=""' > /home/$user/.bashrc
    chattr +i /home/$user/.profile
    chattr +i /home/$user/.bashrc
    echo "Fine"
    printf 'Cambia utente con il comando:\x1b\x5b1;31;40m\tsu -l '$user'\n'
fi
