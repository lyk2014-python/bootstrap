#!/bin/bash
# The MIT License (MIT)
# Copyright (c) 2014 Halit Alptekin, Fatih Erikli
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
# OR OTHER DEALINGS IN THE SOFTWARE.

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
	
	install_from "$APT_INSTALL" $MAKE_R
	install_from "$APT_INSTALL" $BASIC_R
	install_from "$APT_INSTALL" $PYTHON_R
	install_from "$PIP_INSTALL" $PIP_R

	upgrade_system
	force_system
}

# Start installation
install_env
