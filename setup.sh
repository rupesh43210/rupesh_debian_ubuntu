#!/bin/bash

# set up welcome message

    echo "welcome to AIO debian_ubutu_setup"

#check if a user is root

    if [[ $EUID -ne 0 ]]; then
       echo "This script must be run as root" 
       echo " You need to run this script as root"
       exit 1
    fi

#do a update 

    sudo apt update


# do a upgrade

    echo " do you want to run upgrade(Recommended) -Note this can't be undone (Y/n)"
    read upgrade

        if [[ $upgrade == "Y" || $input == "y" ]]; then
                sudo apt upgrade -y
        else
                echo "you can upgrade later with -  sudo apt upgrade"
        fi


#give options to install

    echo " Choose from the below options for installation"


















dvwa

splunk forwarder

splunk server

mariadb

wordpress_nginx

docker and docker compose

  portainer
  bwapp_docker
  sql docker
  wordpress_docker_apache
  
#based on options set varibles if required

#execute scripts

#set a welcome and completion message
