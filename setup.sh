#!/bin/bash

# set up welcome message

    echo "welcome to AIO debian_ubutu_setup"

#check if a user is root

    if [[ $EUID -ne 0 ]]; then
       echo "This script must be run as root" 
       echo " You need to run this script as root - run the command sudo su"
       exit 1
    fi

#do a update 
    sudo apt update
    
# do a upgrade
    echo " Do you want to run upgrade(Recommended) - Note- this can't be interrupted (Y/n)"
    read upgrade

        if [[ $upgrade == "Y" || $input == "y" ]]; then
                sudo apt upgrade -y
        else
                echo "you can upgrade later with -  sudo apt upgrade"
        fi


#give options to install

selectinstall(){
    
                echo " Choose from the below options for installation"

                 cd ~
    
               select feature in dvwa-app splunk-server splunk-forwarder mariadb-server wordpress-nginx docker-dockercompose "exit"

            do
                echo "You have opted : $Reply $feature"
                #echo "Selected number: $REPLY"
                
                         if [[ $REPLY == "1" ]]; then
                                
                                git clone https://github.com/rupesh43210/dvwa-deploy-on-host.git
                                cd ~/dvwa-deploy-on-host
                                sudo chmod +x dvwa.sh
                                sudo ./dvwa.sh
                                cd ~/
                                echo "DVWA app has been successfully installed using mariadb and apache webserver"



                                

                        elif   [[ $REPLY == "2" ]]; then                                
                                git clone https://github.com/rupesh43210/splunk_server.git
                                cd ~/splunk_server
                                sudo chmod +x splunk_server.sh
                                sudo ./splunk_server.sh
                                cd ../
                                echo "splunk server has been successfully installed"

                        elif   [[ $REPLY == "3" ]]; then
                                sudo apt upgrade -y


                        elif   [[ $REPLY == "4" ]]; then
                                sudo apt upgrade -y
                                

                        elif   [[ $REPLY == "5" ]]; then
                                sudo apt upgrade -y


                        elif   [[ $REPLY == "6" ]]; then
                                sudo apt upgrade -y


                        elif   [[ $REPLY == "7" ]]; then
                                exit
                        else
                                echo "Not a valid entry"
                    fi
                         
         done
   

}

if [[ -z ${REPLY} ]]; then
        selectinstall
else
        echo "variable is already set"
fi
