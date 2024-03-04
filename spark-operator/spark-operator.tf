locals {
}

resource "kubernetes_namespace" "spark-jobs" {
  count = var.spark_operator_enabled ? 1 : 0

  metadata {
    name = "spark-jobs"
  }
}

resource "kubernetes_namespace" "spark-operator" {
  count = var.spark_operator_enabled ? 1 : 0

  metadata {
    name = "spark-operator"
  }
}

resource "helm_release" "spark-operator" {
  count = var.spark_operator_enabled ? 1 : 0

  name             = "spark-operator"
  chart            = "${path.module}/../charts/spark-operator"
  timeout          = 600
  create_namespace = false
  namespace        = "spark-operator"
  description      = "Spark on K8s Operator"
  disable_webhooks = true
  skip_crds        = false
  wait             = true
  wait_for_jobs    = true
  values           = [templatefile("spark-values.yaml", {})]

  depends_on = [
    kubernetes_namespace.spark-jobs,
    kubernetes_namespace.spark-operator,
  ]
}
