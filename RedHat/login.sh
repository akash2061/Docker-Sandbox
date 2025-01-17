#!/bin/bash

# Prompt for Red Hat account name
read -p "Enter your Red Hat account name: " ACCOUNTNAME

# Prompt for Red Hat password
read -s -p "Enter your Red Hat password: " PASSWORD
echo

# Register with Red Hat subscription manager
subscription-manager register --username="$ACCOUNTNAME" --password="$PASSWORD"
