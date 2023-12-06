# This script creats public and private keys in ~/.oci with the names RSA.pem  RSA_public.pem and it prints the public key
# Private_Key_path = "/root/.oci/RSA.pem"

mkdir ~/.oci

# Generate a 2048-bit private key in a PEM format:
openssl genrsa -out ~/.oci/RSA.pem 2048

# Change permissions, so only you can read and write to the private key file:
chmod 600 ~/.oci/RSA.pem

#Generate the public key:
openssl rsa -pubout -in ~/.oci/RSA.pem -out ~/.oci/RSA_public.pem

# Message 
echo "--------------------------------------------"
echo "Copy the below public key to your OCI user account"
echo "     ↓      ↓      ↓"

# Show the key and Copy the public key.
cat ~/.oci/RSA_public.pem

#https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/managingkeypairs.htm
