terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "RG-EquipeInterne-jgionet"
    storage_account_name = "stjgdevequipeinterne"
    container_name       = "s-terraform-im-jg-testing-web-application-infra-2-dev"
    key                  = "web-application-infra-2.tfstate"

    use_oidc = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true # Matches the backend authentication
}

# An in-memory null resource that does not create physical infrastructure
resource "null_resource" "backend_test" {
  triggers = {
    test_run_time = timestamp()
  }
}

output "backend_status" {
  value       = "Success! The backend configuration is active and working."
  description = "A simple string confirmation to prove execution completed."
}
