provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
  experiments {
    manifest = true
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
