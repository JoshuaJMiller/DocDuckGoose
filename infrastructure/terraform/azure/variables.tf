variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group"
  default     = "docduckgoose-dev-rg"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources into"
  default     = "eastus"
}
