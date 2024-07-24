variable "admin_username" {
  description = "Admin username VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password VM"
  type        = string
  sensitive   = true
}
