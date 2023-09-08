resource "helm_release" "runner" {
  depends_on = [kubernetes_namespace.ns]
  name       = var.name
  timeout    = 180
  chart      = "gitlab-runner"
  repository = "https://charts.gitlab.io"
  namespace  = var.namespace
  version    = "0.28.0"

  values = [
    templatefile("./tmpl/runner.yaml", {
      image           = var.default_image
      replicas        = var.replicas
      runner_roken    = var.runner_token
      tags            = var.runner_tags
      run_untagged    = var.run_untagged
      service_account = kubernetes_service_account.sa.metadata[0].name
      locked          = var.locked
      protected       = var.protected
    })
  ]
}
