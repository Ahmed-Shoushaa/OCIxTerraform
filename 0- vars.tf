variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "region" {}
variable "private_key_path" {}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

variable "image_operating_system" {
  default = "Ubuntu"
}

variable "image_operating_system_version" {
  default = "22.04"
}

data "oci_core_image" "compute_images" {
  image_id                 = oci_identity_compartment.wind_task_compartment.id
  operating_system         = var.image_operating_system
  operating_system_version = var.image_operating_system_version
}

