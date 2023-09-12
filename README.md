# OCI-Terraform
Simple infrastructure on OCI using Terraform
<p align="center">
  <img width="460" height="300" src="![https://user-images.githubusercontent.com/117172376/227237318-2a672164-8e79-4c08-aebf-581954ae53d3.png">
</p>](Images/oci-architecture.png)
## Prerequisites:

1. **Terraform installed**
    
    ```bash
    # In the script directory
    chmod 700 terraform_install.sh
    ./terraform_install.sh
    ```
    
    For more details: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
    
2. **RSA Keys for authentication and add it’s public key to your user account**
    
    ```
    Note:
    If you're using Oracle Cloud Shell, skip creating the RSA keys. You're already authenticated when you log in to the OCI Console.
    ```
    
    ```bash
    # Run key-gen.sh script which generates RSA keys in ~/.oci
    chmod 700 key-gen.sh
    ./key-gen.sh
    ```
    
    Then Add the public key to your user account.
    
    - In the OCI Console's top navigation bar, click the **Profile** menu, and then go to **User settings**.
    - Click **API Keys**.
    - Click **Add API Key**.
    - Select **Paste Public Keys**.
    - Paste value from previous step, including the lines with `BEGIN PUBLIC KEY` and `END PUBLIC KEY`.
    - Click **Add**.
3. **Add List Policy**
    
    If your username is in the **Administrators** group, then skip this section. Otherwise, ask your administrator to add the following policy to your tenancy:
    
    1. In the top navigation bar, open the **Profile** menu.
    2. Click your username.
    3. In the left pane, click **Groups**.
    4. In a notepad, copy the **Group Name** that your username belongs.
    5. Open the navigation menu and click **Identity & Security**. Under **Identity**, click **Policies**.
    6. Select `<your-tenancy>(root)` from the **Compartment** dropdown.
    7. Click **Create Policy**.
    8. Fill in the following information:
        - **Name:** `list-resources`
        - **Description:** `Allow the group <the-group-your-username-belongs> to list the resources in this tenancy.`
        - **Compartment:** `<your-tenancy>(root)`
    9. For **Policy Builder**, click **Show manual editor**.
    10. Paste in the following policy:
        
        ```
        allow group <the-group-your-username-belongs> to read all-resources in tenancy
        ```
        
    11. Click **Create**.
4. Prepare required data for authentication:
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
            - Path to the **RSA private key** you made in the **Create RSA Keys** section.
                
                Example for Oracle Linux: `~/.oci/RSA.pem`
                

For More details: https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-provider/01-summary.htm

## Run Terraform Scripts:

1. Run [automation.sh](http://automation.sh) which takes the required authentication data as Environmental variables
