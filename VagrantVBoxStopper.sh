#!/bin/bash

# Check if Vagrant is installed
if ! command -v vagrant &> /dev/null; then
    echo -e "\e[31mError: Vagrant is not installed. Please install it first.\e[0m"
    exit 1
fi

# Display running VirtualBox machines
echo -e "\n\e[34mRUNNING MACHINES:\e[0m"
vboxmanage list runningvms | awk '{print $1}' | sed 's/\"//g'
echo


# User prompt
echo -e "\nWhich action on all Vagrant/VirtualBox machines?\n"
echo -e "\t1) \e[32msavestate (suspend)\e[0m"
echo -e "\t2) \e[32mshutdown (soft)\e[0m"
echo -e "\t3) \e[32mshutdown (force)\e[0m"
echo -e "\t4) \e[32mreset\e[0m"
echo -e "\nOther to exit\n"

read -p "? " get

# Set action based on input
case $get in
    1) 
        vboxact="savestate" 
        vgrntact="suspend"
        ;;
    2) 
        vboxact="acpipowerbutton" 
        vgrntact="halt"
        ;;
    3) 
        vboxact="poweroff" 
        vgrntact="halt --force"
        ;;
    4) 
        vboxact="reset" 
        vgrntact="reload"
        ;;
    *) 
        echo -e "\e[31mError: Wrong input. Exiting.\e[0m"
        exit 1
        ;;
esac

# Confirmation prompt
read -p "Are you sure ?(y/n) " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    # Apply Vagrant action
      vagrant "$vgrntact" "$(vagrant global-status --machine-readable | grep machine-id | awk -F, '{print $NF}' | xargs)" &> /dev/null
    # Apply action on VirtualBox VMs if any are running
    vms=$(vboxmanage list runningvms | awk '{print $1}' | sed 's/\"//g')
    if [[ -n "$vms" ]]; then
        for vm in $vms; do
            echo " - $vm"
            vboxmanage controlvm "$vm" "$vboxact" &> /dev/null
        done
    else
        echo -e "\n\e[31mNo running VirtualBox VMs found.\e[0m"
    fi
else
    echo -e "\e[33mAction canceled by the user.\e[0m"
fi

