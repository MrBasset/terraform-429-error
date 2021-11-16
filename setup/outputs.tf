

output "example-rg-name" {
  value = azurerm_resource_group.tf429-dns-rg.name
}

output "example-dns-zone-name" {
  value = azurerm_dns_zone.tf429-dns-zone.name
}