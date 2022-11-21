#!/bin/bash

#chcek is a user is root
checksudo(){
            if [[ $EUID -ne 0 ]]; then
           echo "This script must be run as root" 
           echo " You need to run this script as root - run the command sudo su"
           exit 1
        fi
 }

