variable "role_arn" {
  type        = string
  description = "Role ARN that will be used by the Gitlab Runner jobs."
}

variable "name" {
  type        = string
  description = "Name of the gitlab runner"
}

variable "cluster_name" {
  type        = string
  description = "AWS EKS Cluster name"
}

variable "default_image" {
  type        = string
  default     = ""
  description = "Default Gitlab Runner Job Docker image"
}

variable "replicas" {
  type        = number
  default     = 2
  description = "Number of Gitlab Runner replicas"
}

variable "runner_token" {
  type        = string
  sensitive   = true
  description = "The Gitlab token to use for registering."
}

variable "runner_tags" {
  type        = string
  description = "Comma separated list of runner tags"
}

variable "run_untagged" {
  type        = bool
  default     = false
  description = "If the Gitlab Runner will run untagged jobs"
}

variable "namespace" {
  type        = string
  default     = "gitlab-runner"
  description = "Kubernetes namespace name"
}

variable "annotations" {
  type        = map(string)
  default     = {}
  description = "Annotations applied to all Kubernetes resources"
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = "Labels applied to all Kubernetes resources"
}

variable "create_namespace" {
  type        = bool
  default     = false
  description = "Wether the module should create the namespace or not."
}

variable "locked" {
  type        = bool
  default     = false
  description = "Wether the runner is locked to the project or group."
}

variable "protected" {
  type        = bool
  default     = false
  description = "Wether the runner only accepts protected jobs."
}
