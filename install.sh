#!/bin/bash/
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

while true; do
    read -p "Do you wish to install this program? (y/n): " yn
    case $yn in
        [Yy]* ) 
cp log-xyz.sh log-xyz
chmod +x log-xyz
sed -i "/User specific aliases and functions/a alias lxyz=\'${SCRIPT_DIR}/log-xyz\'" /home/$USER/.bashrc
sed -i "/User specific aliases and functions/a alias logxyz=\'${SCRIPT_DIR}/log-xyz\'" /home/$USER/.bashrc
source /home/$USER/.bashrc; 
break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
