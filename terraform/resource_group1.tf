# Configure the Azure Provider





resource "azurerm_resource_group" "testterr2" {
  name     = "testterr2"
  location = local.location

  tags = {
    environment = "Production"
  }
}

resource "azurerm_role_assignment" "test2" {
  scope                = azurerm_resource_group.testterr2.id
  role_definition_name = "Contributor"
  principal_id         = "7de9f602-70e7-44f1-b961-fa1ced21b807"
  depends_on = [azurerm_resource_group.testterr2]

}




