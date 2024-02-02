# variables.tf

variable "AZ_client_id" {
  type    = string
  default = ""
}

variable "AZ_client_secret_id" {
  type    = string
  default = ""
}

variable "AZ_subscription_id" {
  type    = string
  default = ""
}

variable "AZ_tenant_id" {
  type    = string
  default = ""
}


variable "secure_address" {
  description = "The name of the secure address space."
  type        = string
}

variable "AZ_service_principal_client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
}

variable "AZ_service_principal_client_secret_id" {
  description = "Azure Service Principal Client Secret"
  type        = string
}
