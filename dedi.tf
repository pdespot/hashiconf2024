resource "linode_instance" "terraform-db" {
  image = "linode/ubuntu24.04"
  label = "DemoVM"
  group = "HashiConf2024"
  region = "us-east"
  type = "g6-standard-1"
  authorized_keys = [ "0ff1d17b3c336735f07cb9f4aaa4ce44adb8f7125b691c0aa5ea120a9bdbc0ac" ]
  root_pass = "AkanodeDem0!"
}
