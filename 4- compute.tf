resource "oci_core_instance" "Wind_IS" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
    compartment_id = oci_identity_compartment.tf-compartment.compartment_id
    shape = "VM.Standard2.1"
    source_details {
        source_id = "<source-ocid>"
        source_type = "image"
    }

    # Optional
    display_name = "Wind_IS"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        user_data = file("initial_script.sh")
    } 
    preserve_boot_volume = false
}