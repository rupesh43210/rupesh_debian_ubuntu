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

        if [[ $upgrade == "Y" || $upgrade == "y" ]]; then
                sudo apt upgrade -y
        else
                echo "you can upgrade later with -  sudo apt upgrade"
        fi


#give options to install

selectinstall(){
    
                echo " Choose from the below options for installation"

                 cd ~
                select feature in dvwa-app splunk-server splunk-forwarder mariadb-server-client wordpress-nginx docker-dockercompose "exit"

            do
                echo "You have opted : $REPLY: $feature"
                #echo "Selected number: $REPLY"
                
                         if [[ $REPLY == "1" ]]; then
                                
                                git clone https://github.com/rupesh43210/dvwa-deploy-on-host.git
                                cd ~/dvwa-deploy-on-host || exit
                                sudo chmod +x dvwa.sh
                                sudo ./dvwa.sh
                                cd ~/ || exit
                                echo "DVWA app has been successfully installed using mariadb and apache webserver"                                

                        elif   [[ $REPLY == "2" ]]; then                                
                                git clone https://github.com/rupesh43210/splunk_server.git
                                cd ~/splunk_server || exit
                                sudo chmod +x splunk_server.sh
                                sudo ./splunk_server.sh
                                cd ../
                                echo "splunk server has been successfully installed"

                        elif   [[ $REPLY == "3" ]]; then
                                git clone https://github.com/rupesh43210/splunk_forwarder_install_x86_64.git
                                cd ~/splunk_forwarder_install_x86_64 || exit
                                chmod +x splunk_fowd_install.sh
                                sudo ./splunk_fowd_install.sh
                                cd ../
                                echo "Splunk forwarder has been installed ad configured successfully"


                        elif   [[ $REPLY == "4" ]]; then
                                git clone https://github.com/rupesh43210/mariadb.git
                                cd ~/mariadb || exit
                                chmod +x mariadb.sh
                                cd ../
                                echo "mariadb has been successfully configured"
                                

                        elif   [[ $REPLY == "5" ]]; then
                                cd ~ || exit
                                git clone https://github.com/rupesh43210/wordpress-nginx.git
                                cd ~/wordpress-nginx || exit
                                chmod +x lemp_install.sh
                                sed -i -e 's/\r$//' lemp_install.sh
                                ./lemp_install.sh
                                chmod +x wordpress_part1.sh
                                sed -i -e 's/\r$//' wordpress_part1.sh
                                ./wordpress_part1.sh
                                chmod +x wordpress_part2_ mysql.sh
                                sed -i -e 's/\r$//' wordpress_part2_ mysql.sh
                                ./wordpress_part2_ mysql.sh
                                chmod +x wordpresspart3.sh
                                sed -i -e 's/\r$//' wordpresspart3.sh
                                ./wordpresspart3.sh
                                cd ../
                                echo "Wordpress has been successfully installed"


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
