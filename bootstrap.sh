#!/bin/bash

# Variables for apt-get package manager
APT_INSTALL="sudo apt-get install --yes --quiet"
APT_UPGRADE="sudo apt-get upgrade --yes --quiet"
APT_UPDATE="sudo apt-get update --quiet"
APT_FORCE="sudo apt-get -f install"

# Variable for pip package manager
PIP_INSTALL="sudo pip install -U"

# Requirements files
BASIC_R="basic.txt"
MAKE_R="make.txt"
PYTHON_R="python.txt"
PIP_R="pip.txt"

# Install function with package manager
install_from(){
	for line in $(cat "$2"); do
	  $1 $line
	done	
}

# Package manager utils
update_system(){
	$APT_UPDATE 
}
upgrade_system(){
	$APT_UPGRADE 
}
force_system(){
	$APT_FORCE 
}

# Function for installation
install_env(){
	update_system
	upgrade_system
	
	install_from $APT_INSTALL $MAKE_R
	install_from $APT_INSTALL $BASIC_R
	install_from $APT_INSTALL $PYTHON_R
	install_from $PIP_INSTALL $PIP_R

	upgrade_system
	force_system
}

# Start installation
install_env
