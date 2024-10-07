variable "regions" {
  description = "List of regions to create Linodes in"
  type        = list(string)
}

variable "userid" {
  description = "User ID or identifier to be used in labels and tags"
  type        = string
}

variable "ssh_public_key" {
  description = "Path to the SSH public key file"
  type        = string
  default     = "/root/.ssh/id_rsa.pub"
}

data "local_file" "ssh_key" {
  filename = var.ssh_public_key
}

data "local_file" "api_key" {
  filename = "./api.key"
}

locals {
  # Remove newlines from the SSH key content
  sanitized_ssh_key = replace(data.local_file.ssh_key.content, "\n", "")
}

locals {
  # Remove newlines from the SSH key content
  sanitized_api_key = replace(data.local_file.api_key.content, "\n", "")
}

terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.5.2"
    }
  }
}

provider "linode" {
  token = local.sanitized_api_key
}

resource "linode_instance" "terraform-web" {
        count = length(var.regions)
        label = "HashiConf-${element(var.regions, count.index)}"
        region = element(var.regions, count.index)
        image = "linode/ubuntu24.04"
        group = "HashiConf2024"
        type = "g6-standard-1"
        tags = toset([var.userid])
        authorized_keys = [local.sanitized_ssh_key]
}
