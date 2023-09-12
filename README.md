# OCI-Terraform
Simple infrastructure on OCI using Terraform
<p align="center">
  <img  src="https://github.com/Ahmed-Shoushaa/OCIxTerraform/blob/e51e46cca32c9d44660305d29ecb6c555569a255/Images/oci-architecture.jpg">
</p>

## Prerequisites:

1. **Terraform installed**
    
    ```bash
    # cd to the script directory
    chmod 700 terraform_install.sh
    # For Debian/Ubuntu based images only
    ./terraform_install.sh
    ```
    
    For more details: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
    
2. **RSA Keys for authentication and add it’s public key to your user account**
    
    `Note: If you're using Oracle Cloud Shell, skip creating the RSA keys. You're already authenticated when you log in to the OCI Console.`
    
    ```bash
    # Run key-gen.sh script which generates RSA keys in ~/.oci
    chmod 700 key-gen.sh
    ./key-gen.sh
    ```
    
    Then Add the public key to your user account.
    
    - In the OCI Console's top navigation bar, click the **Profile** menu, and then go to **User settings**.
    - Click **API Keys** -> **Add API Key** -> **Paste Public Keys**
    - Paste value from previous step, including the lines with `BEGIN PUBLIC KEY` and `END PUBLIC KEY` then **Add**
4. **Add List Policy**
    
    If your username is in the Administrators group, then skip this step.
   
   Otherwise, ask your administrator to add the following policy to your tenancy
   
   For details to add policy: https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-provider/01-summary.htm
   
    
6. Prepare required data for authentication:
    1. Collect the following credential information from the **OCI Console**.
        - **Tenancy OCID:**
            - In the top navigation bar, click the **Profile** menu, go to **Tenancy:** *<your-tenancy>*  and copy OCID.
        - **User OCID:**
            - From the **Profile** menu, go to **User settings** and copy OCID.
        - **Fingerprint:**
            - From the **Profile** menu, go to **User settings** and click **API Keys**.
            - Copy the fingerprint associated with the **RSA public key** you made in section 2. The format is: `xx:xx:xx...xx`.
        - **Region:**
            - From the top navigation bar, find your region.
            - From the table in [Regions and Availability Domains](https://docs.oracle.com/iaas/Content/General/Concepts/regions.htm), Find your region's `<region-identifier>`. Example: `us-ashburn-1`.
    2. Collect the following information from **your environment**.
        - **Private Key Path:**
            - Path to the **RSA private key** you made in the **Create RSA Keys** section `~/.oci/RSA.pem`.
                

For More details: https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-provider/01-summary.htm

## Run Terraform Scripts:

We can run the terraform scripts with multiple methods choose one of them:
1. Run automation.sh which takes the required authentication data as Environmental variables and authenticate to oracle api with it then create or delete the infrastructure
    ```bash
    # cd to the script directory
    chmod 700 automation.sh
    ./automation.sh
    ```
<p align="center">
  <img width="500" height="370" src="https://github.com/Ahmed-Shoushaa/OCIxTerraform/assets/117172376/e2d00419-93cf-465d-be42-dd545d15615f">
</p>

2.  Or Uncomment the <provider "oci"> section in provider.tf and add the required data values
<p align="center">
  <img  src="https://github.com/Ahmed-Shoushaa/OCIxTerraform/assets/117172376/71dd5178-4cc3-4cfe-ab80-774955333bd9">
</p>

  ```bash
  terraform init
  terraform apply
  terraform destroy # To delete Infrastructure
  ```


## Access Instance 
The Output of Terraform is the instance public Ip 

The instance have apache server installed it should output this 
<p align="center">
  <img  src="https://github.com/Ahmed-Shoushaa/OCIxTerraform/assets/117172376/f02bb374-ef5b-4406-8104-11ab01932494">
</p>

Unfortunately I didn't have the chance to test most of the Terraform scripts due to the oracle cloud subscription



