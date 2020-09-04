provider "oci" {
  tenancy_ocid = ""
  user_ocid = ""
  fingerprint = ""
  private_key_path = ""
  region = ""
}


resource "oci_core_vcn" "test_vcn" {
    cidr_block = "10.0.0.0/16"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaw5rl3hdbal2ebqj5vcwhsxtjpwwnofzxlsrsq2hdn3j5xp455brq"
}

resource "oci_core_subnet" "test_subnet" {
    #Required
    cidr_block = "10.0.0.0/24"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaw5rl3hdbal2ebqj5vcwhsxtjpwwnofzxlsrsq2hdn3j5xp455brq"
    vcn_id = oci_core_vcn.test_vcn.id
}


resource "oci_core_instance" "test_instance" {
    #Required
    availability_domain = "iWiN:EU-FRANKFURT-1-AD-1"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaw5rl3hdbal2ebqj5vcwhsxtjpwwnofzxlsrsq2hdn3j5xp455brq"
    shape = "VM.Standard.E2.1"

    source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaahxue6crkdeevk75bzw63cmhh3c4uyqddcwov7mwlv7na4lkz7zla"
    # Apply this to set the size of the boot volume that's created for this instance.
    # Otherwise, the default boot volume size of the image is used.
    # This should only be specified when source_type is set to "image".
    #boot_volume_size_in_gbs = "60"

  }
