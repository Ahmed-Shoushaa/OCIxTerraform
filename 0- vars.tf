variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "region" {}
variable "private_key_path" {}

/* fetching the availability domains in the tenancy */
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

