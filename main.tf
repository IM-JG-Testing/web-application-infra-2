terraform {
  required_version = ">= 1.0.0"
}

# An in-memory null resource that does not create physical infrastructure
resource "null_resource" "main_test" {
  triggers = {
    test_run_time = timestamp()
  }
}

module "external_module" {
  source = "git::https://github.com/IM-JG-Testing/iac-modules.git//modules/my-module-1?ref=main"
}

output "backend_status" {
  value       = "Success! The external module configuration is active and working."
  description = "A simple string confirmation to prove execution completed."
}
