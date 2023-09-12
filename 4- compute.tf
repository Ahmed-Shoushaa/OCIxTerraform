data "template_file" "user_data" {
    template = file("initial_script.sh")

}

resource "oci_core_instance" "Wind_IS" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
    compartment_id = oci_identity_compartment.tf-compartment.compartment_id
    display_name = "Wind_IS"
    shape = "VM.Standard2.1"
    source_details {
        source_id = "ocid1.image.oc1.iad.aaaaaaaaevjttsicdlm4h3zomclg6pztgxgg7ba54e27c4oopvkbaftvjqna" 
        source_type = "image"
    }

    # Optional
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        user_data = base64encode(data.template_file.user_data.rendered)
    } 
    preserve_boot_volume = false
}