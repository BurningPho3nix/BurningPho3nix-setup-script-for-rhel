# BurningPho3nix setup script for CentOS Stream (optimized for CentOS Stream 9)

This project helps you installing RPM-Fusion, making dnf.conf changes and installing applications quickly on CentOS Stream.

______________________________________________________

start page options:
- open repo setup
- open package-installer
- open DNF configuration
- open codec setup
- system updates (dnf update & flatpak update)
- reboot system
______________________________________________________

Repo Setup gives you the options to install:
- EPEL (repo)
- RPM Fusion free (repo)
- RPM Fusion nonfree (repo)
- Group core (to enable downloads through software centers)
- RPM Fusion free tainted (repo)
- RPM Fusion nonfree tainted (repo)
- Flathub (repo)
- all of the above

______________________________________________________

DNF modification tool options:
- set default answer to Yes/Y
- set maximum simultaneous downloads to 10
- bring in your own dnf.conf changes
______________________________________________________

Codec Setup options:
- libdvdcss/DVD compatibility
- Nvidia vaapi driver
- Intel media driver

_______________________________________________________

Package Install Helper:
- allows you to type in programs you want installed
and it then searches for those packages with dnf, flatpak and snap
and then installs them.
______________________________________________________

This needs to be enabled on setup.sh:
![Screenshot from 2023-01-17 00-41-11](https://user-images.githubusercontent.com/95959450/212780926-f5806457-5b99-4c5c-9b70-ef21296ea32e.png)

after that open the containing folder in terminal and type in ./setup.sh or in Gnome just right-click and "run as program"

_______________________________________________________
DISCLAIMER

THIS PROJECT HAS NO RELATION TO THE FEDORA PROJECT NOR THE RPM FUSION PROJECT NOR TO FLATHUB.
FURTHERMORE THIS PROJECT HAS NO RELATION TO RED HAT, RED HAT CZECH, RED HAT INDIA AND IBM.

If you have any problems with software from "The Fedora Project", "RPM-Fusion", "Flathub", any "Red Hat" Company or IBM,
please report the issue to them.
If you have issues with the script report those to me through the "Issues" category on Github.
