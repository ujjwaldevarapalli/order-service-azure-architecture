output "function_app_name" {
  value = azurerm_function_app.orders.name
}
output "apim_name" {
  value = azurerm_api_management.orders.name
}
output "sql_database_name" {
  value = azurerm_sql_database.orders.name
}
output "servicebus_queue" {
  value = azurerm_servicebus_queue.orders.name
}
output "logicapp_name" {
  value = azurerm_logic_app_workflow.orders.name
}
