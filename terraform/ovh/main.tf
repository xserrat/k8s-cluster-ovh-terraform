module "k8s-cluster" {
  source = "./module/k8s-cluster"
  ovh_region = var.ovh_region
  ovh_project_id = var.ovh_project_id
  cluster_name = "my-first-cluster"
  environment = "production"
  ovh_node_pool_size = "b2-30" # 30gb ram + 8 cores + 200gb ssd + 500mb/s public network + 2gb/s private network
  desired_nodes = 1
  max_nodes = 1
  min_nodes = 1
  kube_version = 1.24
  providers = {
    ovh = ovh.ovh
  }
}
