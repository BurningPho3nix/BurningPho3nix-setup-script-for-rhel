#!/bin/bash

# Ask for sudo password
        password=$(whiptail --title "Sudo Password" --passwordbox "Please enter your sudo password:" 10 60 3>&1 1>&2 2>&3)

# Use sudo with the entered password
        echo "$password" | sudo -S echo "This command is executed with sudo"
        

# Use whiptail to display a menu with five options
while true; do
OPTION=$(whiptail --title "Menu" --menu "Choose an option" 15 60 5 \
"1" "Repo Setup" \
"2" "DNF modification tool" \
"3" "Codec Setup" \
"4" "Package Install Helper" \
"5" "Update" \
"6" "Reboot" \
"7" "Quit" \
3>&1 1>&2 2>&3)

# Check which option was selected and perform the corresponding action
case $OPTION in
    1)
        # Display a submenu with eight options for Repo Setup
        while true; do
        REPO_OPTION=$(whiptail --title "Repo Setup" --menu "Choose an option" 20 60 8 \
        "1" "Install EPEL" \
        "2" "Install RPM Fusion Free" \
        "3" "Install RPM Fusion Free Tainted" \
        "4" "Install RPM Fusion Non-Free" \
        "5" "Install RPM Fusion Non-Free Tainted" \
        "6" "Install Flathub" \
        "7" "Install All" \
        "8" "Back to main menu" \
        3>&1 1>&2 2>&3)

        # Check which option was selected and perform the corresponding action
        case $REPO_OPTION in
            1)
                {
                echo 0
                sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm 2>&1 | tee /tmp/repo_install.log
                echo 100
                sleep 1
                } | whiptail --gauge "Installing Repo" 6 60 0
                ;;
            2)
                {
                echo 0
                sudo dnf install -y https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm 2>&1 | tee /tmp/repo_install.log
                echo 50
                sudo dnf groupupdate -y core
                echo 100
                sleep 1
                } | whiptail --gauge "Installing Repo" 6 60 0
                ;;
            3)
                {
                echo 0
                sudo dnf install -y rpmfusion-free-release-tainted 2>&1 | tee /tmp/repo_install.log
                echo 100
                sleep 1
                } | whiptail --gauge "Installing Repo" 6 60 0
                ;;
            4)
                {
                echo 0
                sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm 2>&1 | tee /tmp/repo_install.log
                echo 50
                sudo dnf groupupdate -y core
                echo 100
                sleep 1
                } | whiptail --gauge "Installing Repo" 6 60 0
                ;;
            5)
                {
                echo 0
                sudo dnf install -y rpmfusion-nonfree-release-tainted 2>&1 | tee /tmp/repo_install.log
                echo 100
                sleep 1
                } | whiptail --gauge "Installing Repo" 6 60 0
                ;;
            6)
                {
                echo 0
                flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>&1 | tee /tmp/repo_install.log
                echo 100
                sleep 1
                } | whiptail --gauge "Installing Repo" 6 60 0
                ;;
            7)
                {
                echo 0
                sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm 2>&1 | tee /tmp/repo_install.log
                echo 14
                sudo dnf install -y https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm 2>&1 | tee /tmp/repo_install.log
                echo 28
                sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm 2>&1 | tee /tmp/repo_install.log
                echo 42
                sudo dnf groupupdate -y core 2>&1 | tee /tmp/repo_install.log
                echo 57
                sudo dnf install -y rpmfusion-free-release-tainted 2>&1 | tee /tmp/repo_install.log
                echo 71
                sudo dnf install -y rpmfusion-nonfree-release-tainted 2>&1 | tee /tmp/repo_install.log
                echo 85
                flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>&1 | tee /tmp/repo_install.log
                echo 100
                sleep 1
                } | whiptail --gauge "Installing Repos" 6 60 0
                ;;
            8)
                break
                ;;
            *)
                # Display an error message if an invalid option is selected
                whiptail --msgbox "Invalid option selected" 8 40
                ;;
        esac
    done
        ;;
    2)
       # Use whiptail to display a menu with five options
            while true; do
                DNF_OPTION=$(whiptail --title "DNF Modification Tool" --menu "Choose an option" 15 60 5 \
                "1" "Set defaultyes=True" \
                "2" "Set max_parallel_downloads=10" \
                "3" "Set all recommended options" \
                "4" "Add custom option" \
                "5" "Back to main menu" \
                3>&1 1>&2 2>&3)

                # Check which DNF option was selected and perform the corresponding action
                case $DNF_OPTION in
            1)
                # Perform action for Option 1 of DNF modification tool
                sudo dnf config-manager --setopt="defaultyes=True" --save
                ;;
            2)
                # Perform action for Option 2 of DNF modification tool
                sudo dnf config-manager --setopt="max_parallel_downloads=10" --save
                ;;
            3)
                # Perform action for Option 3 of DNF modification tool
                sudo dnf config-manager --setopt="defaultyes=True" --setopt="max_parallel_downloads=10" --save
                ;;
            4)
                # Perform action for Option 4 of DNF modification tool
                soption=$(whiptail --title "Option" --inputbox "Enter an option" 8 40 3>&1 1>&2 2>&3)
                exit_status=$?
                if [ $exit_status = 0 ]; then
                    value=$(whiptail --title "Value" --inputbox "Enter a value for option $option" 8 40 3>&1 1>&2 2>&3)
                    exit_status=$?
                    if [ $exit_status = 0 ]; then
                    sudo dnf config-manager --setopt="$option=$value" --save
                    fi
                fi
                ;;
            5)
                # Perform action for Option 5 of DNF modification tool
                break
                ;;
            *)
                # Display an error message if an invalid option is selected
                whiptail --msgbox "Invalid option selected" 8 40
                ;;
        esac
    done
        ;;
    3)
        # Display a submenu with four options for Codec Setup
        while true; do
        CODEC_OPTION=$(whiptail --title "Codec Setup" --menu "Choose an option" 20 60 8 \
        "1" "DVD support" \
        "2" "Nvidia" \
        "3" "Intel" \
        "4" "Back to main menu" \
        3>&1 1>&2 2>&3)

        # Check which option was selected and perform the corresponding action
        case $CODEC_OPTION in
            1)
            {
            echo 0
                sudo dnf install -y libdvdcss
            echo 100
            sleep 1
                } | whiptail --gauge "Installing Driver" 6 60 0
                ;;
            2)
            {
            echo 0
               sudo dnf install -y nvidia-vaapi-driver
            echo 100
            sleep 1
                } | whiptail --gauge "Installing Driver" 6 60 0
                ;;
            3)
            {
            echo 0
               sudo dnf install -y intel-media-driver
            echo 100
            sleep 1
                } | whiptail --gauge "Installing Driver" 6 60 0
                ;;
            4)
                break
                ;;
            *)
                # Display an error message if an invalid option is selected
                whiptail --msgbox "Invalid option selected" 8 40
                ;;
        esac
    done
        ;;
    4)
       if command -v dnf &> /dev/null; then
        PACKAGE_MANAGER="dnf"
       elif command -v flatpak &> /dev/null; then
        PACKAGE_MANAGER="flatpak"
       elif command -v snap &> /dev/null
       then
        PACKAGE_MANAGER="snap"
       else
        whiptail --title "Error" --msgbox "Neither dnf, flatpak, nor snap is available on this system." 10 40
    exit 1
fi

# Prompt the user to enter the names of packages they want to install
PACKAGES=$(whiptail --title "Package Installation" --inputbox "Enter the names of packages you want to install (separated by spaces):" 10 60 3>&1 1>&2 2>&3)

# Check if the user canceled or did not provide any packages
if [ $? -ne 0 ] || [ -z "$PACKAGES" ]; then
    whiptail --title "Error" --msgbox "No packages provided. Exiting." 10 40
    exit 1
fi

# Attempt to install each package using the appropriate package manager
{
echo 0
for PACKAGE in $PACKAGES; do
    if [ "$PACKAGE_MANAGER" = "dnf" ]; then
        if dnf search -C $PACKAGE | grep -q "^$PACKAGE" >/dev/null 2>&1; then
            sudo dnf install $PACKAGE -y
 echo 33
        elif command -v flatpak &> /dev/null; then
            whiptail --title "Package Installation" --msgbox "$PACKAGE not found in system repositories, attempting to install using flatpak." 10 60
            flatpak install $PACKAGE -y
 echo 66
         elif command -v snap &> /dev/null; then
            whiptail --title "Package Installation" --msgbox "$PACKAGE not found in system repositories and flatpak attempting to install using snap." 10 60
            snap install $PACKAGE
 echo 100
        else
            whiptail --title "Error" --msgbox "$PACKAGE not found in system repositories and flatpak and snap is not available on this system." 10 60
        fi
    elif [ "$PACKAGE_MANAGER" = "flatpak" ]; then
        flatpak install $PACKAGE
    elif [ "$PACKAGE_MANAGER" = "snap" ]; then
        snap install $PACKAGE
    fi
done
sleep 1
 } | whiptail --gauge "Installing Packages" 6 60 0
        ;;
    5)
      {
        echo 0
        sudo dnf update -y
        echo 50
        flatpak update -y
        echo 100
        sleep 1
       } | whiptail --gauge "Updating System" 6 60 0
        ;;
    6)
      {
        echo Rebooting system...
        reboot
        echo Rebooting system...
         sleep 1
       } | whiptail --gauge "Rebooting system..." 6 60 0
        ;;
    7)
        whiptail --msgbox "Exiting script..." 8 40
        exit 0
        ;;
    *)
        whiptail --msgbox "Invalid option selected" 8 40
        ;;
    esac
done
