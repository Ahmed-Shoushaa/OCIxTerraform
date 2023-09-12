module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.5.2"
  compartment_id = "<compartment id where to create all resources>"
  create_internet_gateway = true
  region = "<region to provision infra>"
  vcn_name = "<required vcn name>"
  vcn_cidrs = ["10.0.0.0/16"]
}