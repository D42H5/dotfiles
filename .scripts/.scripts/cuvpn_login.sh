#!/bin/bash

USER="djhogg"
OPTION="push"
PASSWD=""

# Read in password for keepassxc database
#read -sp "Enter db password: " PASSWD

# Get Clemson login password
CREDS="$(echo ${PASSWD} | keepassxc-cli show -q .password_database.kdbx Clemson -sa password)"

# Stream login info to openconnect to cuvpn.clemson.edu
echo -e "${CREDS}\n${OPTION}" | sudo openconnect -u ${USER} cuvpn.clemson.edu
