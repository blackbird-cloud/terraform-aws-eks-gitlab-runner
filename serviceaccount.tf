locals {
  service_account_annotations = merge(var.annotations, {
    "eks.amazonaws.com/role-arn" = var.role_arn
  })
}

resource "kubernetes_service_account" "sa" {
  metadata {
    annotations = local.service_account_annotations
    labels      = var.labels
    name        = var.name
    namespace   = var.namespace
  }
  secret {
    name = kubernetes_secret.secret.metadata[0].name
  }
}

resource "kubernetes_secret" "secret" {
  metadata {
    annotations = var.annotations
    labels      = var.labels
    name        = var.name
    namespace   = var.namespace
  }
}
