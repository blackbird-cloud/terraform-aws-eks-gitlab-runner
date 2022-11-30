resource "kubernetes_namespace" "ns" {
  count = var.create_namespace ? 1 : 0

  metadata {
    annotations = var.annotations
    labels      = var.labels
    name        = var.name
  }
}
