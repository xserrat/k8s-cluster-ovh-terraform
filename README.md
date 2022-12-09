# Terraform OVH Cloud (Public Cloud) - Kubernetes Cluster 

## 1. Create user for OpenStack (hosted by OVH)
Go to the Users & Roles section from the OVH Administration panel and create a new User as Administrator

## 2. Create a new application in the OVH API:
You can check it out [this OVH section](https://docs.ovh.com/gb/en/api/first-steps-with-ovh-api/#advanced-usage-pair-ovhcloud-apis-with-an-application_2)
Go to the endpoint [createToken](https://eu.api.ovh.com/createToken/) and log in with the user created in the first
step. Then specify:
* Validation (i.e: 1 day)
* Rights: Add all http methods available in the API (GET, POST, PUT, DELETE) and a wildcard (*) for the second field
Finally, click on `Create keys`.

## 3. Save the following credentials
We should use the following credentials to authenticate against the OVH API in the Terraform Provider:
- `application_key`
- `application_secret`
- `consumer_key`

## 4. Fill the following terraform variables
You can create a file `.tfvars` filling the values with the following variables:
```hcl
# my_vars.tfvars
ovh_project_id = "<public_cloud_project_id>"
ovh_region = "<region>"
ovh_api_application_key = "<application_key_obtained_from_step_3>"
ovh_api_application_secret = "<application_secret_from_step_3>"
ovh_api_consumer_key = "<consumer_key_from_step_3>"
```
## 5. Enjoy your Kubernetes cluster created using Terraform!