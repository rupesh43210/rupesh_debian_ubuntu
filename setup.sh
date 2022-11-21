#!/bin/bash

source ./aiofunctions.sh

# set up welcome message

gitclean=$(pwd)
arch=$(uname -m)

echo "welcome to AIO debian_ubutu_setup"
echo your system architecture $arch

#check if a user is root
checksudo
    

#do a update 
    sudo apt update
    
# do a upgrade
    echo " Do you want to run upgrade(Recommended) - Note- this can't be interrupted (Y/n)"
    read upgrade
        if [[ $upgrade == "Y" || $upgrade == "y" ]]; then
                sudo apt upgrade -y
        else    echo "you can upgrade later with -  sudo apt upgrade"
        fi



if [[ -z ${REPLY} ]]; then
           selectinstall
    else   echo "variable is already set"
fi


echo "Thankyou"
