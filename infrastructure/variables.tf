variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "sql_admin_password" {
  description = "Password for SQL Server admin"
  type        = string
  default     = "ChangeMe123!"
}
