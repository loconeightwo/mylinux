#!/bin/bash

# ---------------[ Persona Plymouth Installation ]--------------
# -------------------------[version 2.5]------------------------
# ------------[ Created by M. Syarief Hidayatulloh ]------------
# ------------------[ me.msyariefh@gmail.com ]------------------
# --[ Not for Commercial use, except with my permission !!!! ]--
# ------------------------[ Terimakasih ]-----------------------

#=========================[ Thanks to ]========================#
# Allah SWT
# Ryuffhant [ https://github.com/ryuffhant ] for your contribution
#==============================================================#
#========================= [ Constant ]========================#
Text='\033[1;32m'
NC='\033[0m'

if ((${EUID:-0} || "$(id -u)")); then
  clear
  sleep 1.5
  	echo -e "${NC}Sorry, You are not root"
  sleep 1.0
  	echo "Please run using sudo command"
  sleep 1.0
  	echo -e "${Text}Cancelling Installation Command"
  sleep 1.5
  exit 1
else
  clear
  sleep 1.5
  	echo -e "${Text}Please Wait Until Installing Complete"
  sleep 1.5
  	echo -e "${NC}Copying All Persona Plymouth file"
  	cp -iRv persona_circle /usr/share/plymouth/themes/
  sleep 1.5
  clear
  	echo -e "${Text}Please Wait Until Installing Complete"
  	echo -e "${NC}Configuring All Persona Plymouth"
  sleep 1.5
  	update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/persona_circle/persona_circle.plymouth 100
  	echo -e "${Text}All Persona Plymouth Theme Configured"
  sleep 1.5
  clear
  	echo "Select Number of Plymouth Theme"
  sleep 1.0
    echo -e "${NC} "
  	update-alternatives --config default.plymouth
  	update-initramfs -u
  sleep 0.5
  	echo "Finish"
  sleep 1.5
  clear
fi
