# Infrastructure for Order Service REST API

This directory contains Terraform files for provisioning Azure resources according to the approved integration architecture:
- Azure API Management (APIM)
- Azure Function App
- Azure Service Bus (optional)
- Azure SQL Database (as backend for order data)
- Logic Apps (optional workflow)
- Supporting resources: Resource Group, Storage Account
- Managed Identities, RBAC, Networking
