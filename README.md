<!-- BEGIN_TF_DOCS -->
# Terraform Aws Eks Gitlab Runner Module
Terraform module to deploy Gitlab Runner on EKS

[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://blackbird.cloud)

## Example
```hcl
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
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.15.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.4.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.15.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.4.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.22.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.runner](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [kubernetes_namespace.ns](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/resources/namespace) | resource |
| [kubernetes_secret.secret](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/resources/secret) | resource |
| [kubernetes_service_account.sa](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/resources/service_account) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Annotations applied to all Kubernetes resources | `map(string)` | `{}` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | AWS EKS Cluster name | `string` | n/a | yes |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Wether the module should create the namespace or not. | `bool` | `false` | no |
| <a name="input_default_image"></a> [default\_image](#input\_default\_image) | Default Gitlab Runner Job Docker image | `string` | `""` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels applied to all Kubernetes resources | `map(string)` | `{}` | no |
| <a name="input_locked"></a> [locked](#input\_locked) | Wether the runner is locked to the project or group. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the gitlab runner | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace name | `string` | `"gitlab-runner"` | no |
| <a name="input_protected"></a> [protected](#input\_protected) | Wether the runner only accepts protected jobs. | `bool` | `false` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of Gitlab Runner replicas | `number` | `2` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | Role ARN that will be used by the Gitlab Runner jobs. | `string` | n/a | yes |
| <a name="input_run_untagged"></a> [run\_untagged](#input\_run\_untagged) | If the Gitlab Runner will run untagged jobs | `bool` | `false` | no |
| <a name="input_runner_tags"></a> [runner\_tags](#input\_runner\_tags) | Comma separated list of runner tags | `string` | n/a | yes |
| <a name="input_runner_token"></a> [runner\_token](#input\_runner\_token) | The Gitlab token to use for registering. | `string` | n/a | yes |

## Outputs

No outputs.

## About

We are [Blackbird Cloud](https://blackbird.cloud), Amsterdam based cloud consultancy, and cloud management service provider. We help companies build secure, cost efficient, and scale-able solutions.

Checkout our other :point\_right: [terraform modules](https://registry.terraform.io/namespaces/blackbird-cloud)

## Copyright

Copyright © 2017-2024 [Blackbird Cloud](https://blackbird.cloud)
<!-- END_TF_DOCS -->