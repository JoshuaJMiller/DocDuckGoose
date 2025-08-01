terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.75.0, < 4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_servicebus_namespace" "sb" {
  name                = "docduckgoose-sb-ns"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_container_app_environment" "env" {
  name                = "docduckgoose-env"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_container_app" "api" {
  name                         = "docduckgoose-api"
  container_app_environment_id = azurerm_container_app_environment.env.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  secret {
      name  = "acr-password"
      value = var.acr_admin_password
    }

  registry {
    server               = var.acr_login_server
    username             = var.acr_admin_username
    password_secret_name = "acr-password"
  }

  ingress {
    external_enabled = true
    target_port      = 8080

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  template {
    container {
      name   = "docduckgoose-api"
      image  = "${var.acr_login_server}/docduckgoose-api:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}