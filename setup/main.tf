resource "azurerm_resource_group" "tf429-dns-rg" {
  name     = "tf429-dns-rg"
  location = "UK South"
}

resource "azurerm_dns_zone" "tf429-dns-zone" {
  # use a totally random domain in the hopes we aren't going to accidentally DNS poision someone.
  name                = "axdfoiukc.net"
  resource_group_name = azurerm_resource_group.tf429-dns-rg.name
}