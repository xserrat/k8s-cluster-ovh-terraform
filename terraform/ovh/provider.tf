terraform {
  required_version = ">= 1.1.7"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.48.0"
    }

    ovh = {
      source = "ovh/ovh"
      version = "0.23.0"
    }
  }
}

# Configure the OpenStack provider hosted by OVHcloud
provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/" # Authentication URL
  domain_name = "default" # Domain name - Always at 'default' for OVHcloud
  alias = "ovh"
}

provider "ovh" {
  alias = "ovh"
  endpoint = "ovh-eu"
  application_key = var.ovh_api_application_key
  application_secret = var.ovh_api_application_secret
  consumer_key = var.ovh_api_consumer_key
}
