resource "oci_identity_compartment" "wind_task_compartment" {
  # Required
  compartment_id = var.tenancy_ocid
  description    = "Compartment for Terraform resources."
  name           = "Wind_task"
}