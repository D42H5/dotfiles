#!/bin/bash

OPTION="push"
DB_PASSWD=""

# Read in password for keepassxc database
#read -sp "Enter db password: " PASSWD

# Get Clemson username and login password
CREDS="$(echo ${DB_PASSWD} | keepassxc-cli show -q ~/.password_database.kdbx Clemson -a username -sa password)"

# Split the credentials into an array
set -o noglob
IFS=$'\n' CREDS=($CREDS)
set +o noglob

# Set username and password into their own variables
USER=${CREDS[0]}
PASS=${CREDS[1]}

# Stream login info to openconnect to cuvpn.clemson.edu
echo -e "${PASS}\n${OPTION}" | sudo openconnect -u ${USER} cuvpn.clemson.edu
