# Keep uncommented only if you use automation.sh script
terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.12.0"
    }
  }
}

# We Provide the auth variables as ENV variables if we use the automation.sh script 
# If not un comment the below section and add the data between "" 

/* provider "oci" {
  tenancy_ocid     = "<tenancy-ocid>"
  user_ocid        = "<user-ocid>"
  private_key_path = "<rsa-private-key-path>"
  fingerprint      = "<fingerprint>"
  region           = "<region-identifier>"
} */
