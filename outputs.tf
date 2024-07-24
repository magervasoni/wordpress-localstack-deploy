output "public_ip" {
  value = azurerm_public_ip.wordpress.ip_address
}

output "admin_username" {
  value = var.admin_username
}
