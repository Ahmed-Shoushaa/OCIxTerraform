# CREATE NETWORK COMPONENTS REQUIRED FOR A PUBLIC INSTANCE

module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.5.2"
  compartment_id = oci_identity_compartment.tf-compartment.id
  create_internet_gateway = true
  region = var.region
  vcn_name = "vcn"
  vcn_cidrs = ["10.0.0.0/16"]
}

resource "oci_core_security_list" "public-security-list"{

# Required
  compartment_id = oci_identity_compartment.tf-compartment.compartment_id
  vcn_id = module.vcn.vcn_id

# Optional
  display_name = "security-list-for-public-subnet"

# Allows all outgoing traffic (regardless of the protocol) to any destination IP address. 
  egress_security_rules {
      stateless = false
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all" 
  }
# Allow ssh connections
  ingress_security_rules { 
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      tcp_options { 
          min = 22
          max = 22
      }
    }
# Allow Incoming Ping requests to the Instance
  ingress_security_rules { 
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      protocol = "1"
      icmp_options {
        type = 3
        code = 4
      } 
    }   
# Allow HTTP requests to the Instance 
  ingress_security_rules {
    stateless = false
    source = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol = "6"  
    tcp_options {
      min = 80  
      max = 80
    }
  }

}

resource "oci_core_subnet" "vcn-public-subnet"{

  # Required
  compartment_id = oci_identity_compartment.tf-compartment.compartment_id
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.0.0.0/24"
 
  # Optional
  route_table_id = module.vcn.ig_route_id
  security_list_ids = oci_core_security_list.public-security-list.id
  display_name = "public-subnet"
}