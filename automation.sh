#!/bin/bash
echo "
############################################
        ___        ____  ____   _    _   ___
||  || ||    ||   ||    ||  || ||\  /|| ||
||  || | ==  ||   ||    ||  || || \/ || | ==
||/\|| ||__  ||__ ||___ ||__|| ||    || ||__
                    
############################################
"
echo "This script will either"
echo "1- Run terraform scripts to Provision simple infrastructure In OCI:"
echo "   - Compartment to contain the resources"
echo "   - VCN with (IGW, Public Security List, Public subnet) "
echo "   - Compute Instance"
echo "2- Destroy the created infrastructure"
echo "------------------------------------------------------------------------------------------------------------------------------"
read -p "
Enter either 1 -> (Create) 
          or 2 -> (Destroy): " desicion
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
case $desicion in
        1)
                echo "----------------------------------"
                echo "Prerequisites: 1- Tenancy OCID"
                echo "               2- User OCID"
                echo "               3- Fingerprint "
                echo "               4- Region "
                echo "--------------------------------------------------------------------"
                echo "PLEASE ENTER YOUR OCI CREDENTIALS"
                echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                read -p "Enter your Tenancy OCID: " tenancy_ocid
                read -p "Enter your User OCID: " user_ocid
                read -p "Enter your Fingerprint: " fingerprint
                read -p "Enter your Region: " region
                read -p "Enter Private Key Path: " private_key_path
                export TF_VAR_tenancy_ocid=$tenancy_ocid
                export TF_VAR_user_ocid=$user_ocid
                export TF_VAR_fingerprint=$fingerprint
                export TF_VAR_region=$region
                export TF_VAR_private_key_path=$private_key_path
                cd terraform/
                terraform init
                terraform apply 
                ;;
        2)
                echo "PLEASE ENTER YOUR OCI CREDENTIALS To Delete Infrastructure"
                echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                read -p "Enter your Tenancy OCID: " tenancy_ocid
                read -p "Enter your User OCID: " user_ocid
                read -p "Enter your Fingerprint: " fingerprint
                read -p "Enter your Region: " region
                read -p "Enter Private Key Path: " private_key_path
                export TF_VAR_tenancy_ocid=$tenancy_ocid
                export TF_VAR_user_ocid=$user_ocid
                export TF_VAR_fingerprint=$fingerprint
                export TF_VAR_region=$region
                export TF_VAR_private_key_path=$private_key_path
                cd terraform/
                terraform destroy 
                ;;
        *)
                echo "PLEASE ENTER A VALID OPTION"
esac