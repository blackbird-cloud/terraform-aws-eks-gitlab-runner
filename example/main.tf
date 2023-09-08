module "gitlab_runner" {
  source  = "blackbird-cloud/eks-gitlab-runner/aws"
  version = "~> 1"

  name                    = "production_runner"
  cluster_id              = "production_cluster"
  default_image           = "registry.gitlab.com/gitlab-org/terraform-images/stable:latest"
  replicas                = 1
  gitlab_com_runner_token = "xxxxxxxxxxxxxxx"
  runner_tags             = "production"
  run_untagged            = false
}
