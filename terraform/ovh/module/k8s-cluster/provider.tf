terraform {
  required_version = ">= 1.1.7"
  required_providers {
    ovh = {
      source = "ovh/ovh"
      version = "0.23.0"
      configuration_aliases = [ ovh ]
    }
  }
}
