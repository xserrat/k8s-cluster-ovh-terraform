resource "ovh_cloud_project_kube" "kube_cluster" {
  name         = var.cluster_name
  service_name = var.ovh_project_id
  region       = var.ovh_region
  version      = var.kube_version
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  kube_id       = ovh_cloud_project_kube.kube_cluster.id
  name          = format("%s-node-pool", ovh_cloud_project_kube.kube_cluster.name)
  service_name  = var.ovh_project_id
  flavor_name   = var.ovh_node_pool_size
  desired_nodes = var.desired_nodes
  max_nodes     = var.max_nodes
  min_nodes     = var.min_nodes
  template {
    metadata {
      annotations = {
        environment = var.environment
      }
    }
  }
}

resource "local_file" "kubeconfig_file" {
  content  = ovh_cloud_project_kube.kube_cluster.kubeconfig
  filename = "kubeconfig"
}
