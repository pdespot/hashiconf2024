terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.5.2"
    }
  }
}

provider "linode" {
  token = "0ff1d17b3c336735f07cb9f4aaa4ce44adb8f7125b691c0aa5ea120a9bdbc0ac"
}

resource "linode_instance" "terraform-web" {
        image = "linode/ubuntu24.04"
        label = "Example created by Terraform"
        group = "HashiConf"
        region = "us-east"
        type = "g6-standard-1"
        authorized_keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFRxTCwPmJOguXvWD4+bYQfrnzN4RDE1wel1v69u1tlR1MWLpi4nMyaNduT8
GGUEzhEmTuNPPMtpq+3/3PGf/vNbNGoW+BtrafjSR/nT++WIaLW+gRJT3J1wcM2cD0tJh/4Rjkg7siJSUNm7B01xFFGmU71VCG0irufKUXIpnt6WuOxLceVv8JizwZU
6W0b0woKaLIgY0kaVEuVk955LVAkwJVd2fPxXio6aSsAQ5gcGKwEldZ60DkFlGGmPeGhFBH+QEPJIXnDRtgk845wyJScdbGwlB+CfNyl1+0I4wwsD44PBLgRiJGIDp5
Nrk3Sf/z0cqjalRFPsknGUXaAEkr pdespot-linode-20240925" ]
        root_pass = "AkanodeDem0!"
}
