

data "external" "env" {
  program = ["${path.module}/script/env.sh"]
  
}

output "name" {
  value = data.external.env
}

resource "bigip_ltm_profile_client_ssl" "app1-home-lab-ClientSsl" {
  name          = format ("/%s/app1-home-lab-ClientSsl", var.partition)
  defaults_from = "/Common/clientssl"
  authenticate  = "always"
  ciphers       = "DEFAULT"
  cert = data.terraform_remote_state.f5secret.outputs.public-key.app1-home-lab
  key =  data.terraform_remote_state.f5secret.outputs.private-key.app1-home-lab
}

resource "bigip_ltm_profile_client_ssl" "app2-home-lab-ClientSsl" {
  name          = format ("/%s/app1-home-lab-ClientSsl", var.partition)
  defaults_from = "/Common/clientssl"
  authenticate  = "always"
  ciphers       = "DEFAULT"
  cert = data.terraform_remote_state.f5secret.outputs.public-key.app1-home-lab
  key =  data.terraform_remote_state.f5secret.outputs.private-key.app1-home-lab
}