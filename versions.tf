terraform {
  required_providers {
    aws = {
      version = "5.15.0"
      source  = "hashicorp/aws"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.22.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }
  }
  required_version = ">= 1"
}
