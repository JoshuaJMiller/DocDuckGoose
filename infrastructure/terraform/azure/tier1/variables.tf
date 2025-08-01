variable "resource_group_name" {
  type = string
  default = "docduckgoose-dev-rg"
}

variable "location" {
  type = string
  default = "eastus"
}

variable "acr_login_server" {
  type = string
  default = "docduckgooseacr.azurecr.io"
}

variable "acr_admin_username" {
  type = string
  default = "docduckgooseacr"
}

variable "acr_admin_password" {
  type = string
  sensitive = true
}
