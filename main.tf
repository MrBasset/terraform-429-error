data "terraform_remote_state" "setup" {
  backend = "azurerm"
  config = {
    storage_account_name = "tf429tfstate001"
    resource_group_name  = "tf429-tfstate-rg"
    container_name       = "tf429-terraform-state"
    key                  = "resources.tfstate"
  }
}

resource "azurerm_dns_cname_record" "target" {
  count               = 2000

  name                = "tf429-example${format("%04d", count.index + 1)}"
  zone_name           = data.terraform_remote_state.setup.outputs.example-dns-zone-name
  resource_group_name = data.terraform_remote_state.setup.outputs.example-rg-name
  ttl                 = 3600
  record              = "example.com"

  timeouts {
    read              = "60m"
  }
}