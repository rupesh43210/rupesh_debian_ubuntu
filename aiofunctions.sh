#!/bin/bash

#chcek is a user is root
checksudo(){
            if [[ $EUID -ne 0 ]]; then
           echo "This script must be run as root" 
           echo " You need to run this script as root - run the command sudo su"
           exit 1
        fi
 }


#give options to install
selectinstall(){    
                echo " Choose from the below options for installation"                
                cd ~
                
                select feature in dvwa-app splunk-server splunk-forwarder mariadb-server-client wordpress-nginx docker-dockercompose snort "exit"
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
                                git clone https://github.com/rupesh43210/wordpress_host_install.git
                                cd ~/wordpress_host_install
                                chmod +x 1_lemp_install.sh
                                ./1_lemp_install.sh
                                cd ../
                                echo "Wordpress has been successfully installed"                              

                        elif   [[ $REPLY == "6" ]]; then
                                cd ~/rupesh_debian_ubuntu || exit
                                git clone https://github.com/rupesh43210/docker-install.git
                                cd docker-install
                                rm wordpressdocker.sh
                                chmod +x dockersetup.sh
                                cd ../
                                echo "docker and docker-compose with portainer installed"
                                
                        elif   [[ $REPLY == "7" ]]; then
                                sudo apt-get install -y snort
                                
                        elif   [[ $REPLY == "8" ]]; then                        
                                echo "cleaning up"
                                cd $gitclean || exit
                                #ls
                                cd ../
                                #ls
                                rm -r rup*/
                                break
                                
                        else  echo "Not a valid entry"
                    fi
                         
         done  

}
