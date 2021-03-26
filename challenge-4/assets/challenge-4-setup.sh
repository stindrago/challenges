#!/bin/sh

user=$1
hostname=$2

if [ $(hostname) = $hostname ]
then
    chsh -s /bin/rbash $user
    mkdir /home/$user/bin
    chmod 755 /home/$user/bin
    ln -s /bin/vi /home/$user/bin/
    echo 'PATH=""' > /home/$user/.bashrc
    chattr +i /home/$user/.profile
    chattr +i /home/$user/.bashrc
fi
