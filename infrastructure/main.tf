provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "orders" {
  name     = "orders-rg"
  location = "eastus"
}

resource "azurerm_storage_account" "orders" {
  name                     = "ordersappstorage"
  resource_group_name      = azurerm_resource_group.orders.name
  location                 = azurerm_resource_group.orders.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "orders" {
  name                = "orders-func-plan"
  resource_group_name = azurerm_resource_group.orders.name
  location            = azurerm_resource_group.orders.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_function_app" "orders" {
  name                = "orders-func-app"
  resource_group_name = azurerm_resource_group.orders.name
  location            = azurerm_resource_group.orders.location
  storage_account_name= azurerm_storage_account.orders.name
  service_plan_id     = azurerm_service_plan.orders.id
  app_settings        = {
    FUNCTIONS_EXTENSION_VERSION = "~4"
    AzureWebJobsStorage         = azurerm_storage_account.orders.primary_connection_string
    WEBSITE_RUN_FROM_PACKAGE    = "1"
  }
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_api_management" "orders" {
  name                = "orders-apim"
  location            = azurerm_resource_group.orders.location
  resource_group_name = azurerm_resource_group.orders.name
  publisher_name      = "Order Team"
  publisher_email     = "orders@example.com"
  sku_name            = "Developer_1"
}

resource "azurerm_sql_server" "orders" {
  name                         = "ordersqlsvr"
  resource_group_name          = azurerm_resource_group.orders.name
  location                     = azurerm_resource_group.orders.location
  administrator_login          = "sqladmin"
  administrator_login_password = "ChangeMe123!"
}

resource "azurerm_sql_database" "orders" {
  name                = "ordersdb"
  resource_group_name = azurerm_resource_group.orders.name
  location            = azurerm_resource_group.orders.location
  server_name         = azurerm_sql_server.orders.name
  edition             = "Basic"
}

resource "azurerm_servicebus_namespace" "orders" {
  name                = "orders-sbus-ns"
  resource_group_name = azurerm_resource_group.orders.name
  location            = azurerm_resource_group.orders.location
  sku                 = "Basic"
}

resource "azurerm_servicebus_queue" "orders" {
  name                = "ordersqueue"
  resource_group_name = azurerm_resource_group.orders.name
  namespace_name      = azurerm_servicebus_namespace.orders.name
}

resource "azurerm_logic_app_workflow" "orders" {
  name                = "orders-logicapp"
  location            = azurerm_resource_group.orders.location
  resource_group_name = azurerm_resource_group.orders.name
}
