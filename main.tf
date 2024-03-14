resource "azurerm_resource_group" "rg_maheshstorage" {  # Changed name to rg_maheshstorage
  name     = "maheshstorageaccount"
  location = "West Europe"
}

resource "azurerm_storage_account" "maheshstorage" {  # Changed name to maheshstorage
  name                     = "mahesh1989saranya"
  resource_group_name      = azurerm_resource_group.rg_maheshstorage.name
  location                 = azurerm_resource_group.rg_maheshstorage.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "maheshcontainer" {  # Changed name to maheshcontainer
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.maheshstorage.name  # Referenced the storage account with its unique name
  container_access_type = "private"
}
