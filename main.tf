terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.yc_zone
}

variable "yc_token" {
  description = "Yandex Cloud API token"
  type        = string
  sensitive   = true
}

variable "yc_cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "yc_folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "yc_zone" {
  description = "Yandex Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "bucket_access_key" {
  description = "Access key for the bucket"
  type        = string
  sensitive   = true
}

variable "bucket_secret_key" {
  description = "Secret key for the bucket"
  type        = string
  sensitive   = true
}

variable "kms_key_id" {
  description = "ID of the KMS key for server-side encryption"
  type        = string
}

resource "yandex_storage_bucket" "bucket" {
  bucket = var.bucket_name
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
        kms_master_key_id = var.kms_key_id
      }
    }
  }
}

output "bucket_name" {
  description = "The name of the bucket"
  value       = yandex_storage_bucket.bucket.bucket
}

output "bucket_domain_name" {
  description = "The domain name of the bucket"
  value       = yandex_storage_bucket.bucket.bucket_domain_name
} 