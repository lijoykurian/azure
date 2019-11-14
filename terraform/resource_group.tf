# Configure the Azure Provider
data "azurerm_subscription" "primary" {}

locals{
  location="Central US"
}
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  #version = "=1.36.0"
} 

resource "azurerm_resource_group" "testterr1" {
  name     = "testterr1"
  location = local.location

  tags = {
    environment = "Production"
  }
}

resource "azurerm_role_assignment" "test" {
  scope                = azurerm_resource_group.testterr1.id
  role_definition_name = "Contributor"
  principal_id         = "7de9f602-70e7-44f1-b961-fa1ced21b807"
  depends_on = [azurerm_resource_group.testterr1]

}




