# Outputs for compute instance
output "public-ip-for-compute-instance" {
  value = oci_core_instance.Wind_IS.public_ip
}

/* # Output the "list" of all availability domains.
output "all-availability-domains-in-your-tenancy" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}

# Outputs for compartment
output "compartment-name" {
  value = oci_identity_compartment.tf-compartment.name
}

output "compartment-OCID" {
  value = oci_identity_compartment.tf-compartment.id
}

# Outputs for the vcn module
output "vcn_id" {
  description = "OCID of the VCN that is created"
  value = module.vcn.vcn_id
}

# Outputs for public security list
output "public-security-list-name" {
  value = oci_core_security_list.public-security-list.display_name
}
output "public-security-list-OCID" {
  value = oci_core_security_list.public-security-list.id
}

# Outputs for public subnet
output "public-subnet-name" {
  value = oci_core_subnet.vcn-public-subnet.display_name
}
output "public-subnet-OCID" {
  value = oci_core_subnet.vcn-public-subnet.id
}

 */
