module "gitlab_runner" {
  source  = "blackbird-cloud/eks-gitlab-runner/aws"
  version = "~> 1"

  create_namespace = true
  role_arn         = "arn:xxxxxx:xx/xxxx/xxx"
  name             = "production_runner"
  cluster_name     = "production_cluster"
  default_image    = "registry.gitlab.com/gitlab-org/terraform-images/stable:latest"
  replicas         = 1
  runner_token     = "xxxxxxxxxxxxxxx"
  runner_tags      = "production"
  run_untagged     = false
}
