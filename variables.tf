variable "vcd_max_retry_timeout" {
  type = number
}

variable "tf_environment" {
  type    = string
  default = "default"
}

variable "vcd_config_dir" {
  type = string
}

variable "vcd_cred_file" {
  type = string
}

variable "vcd_vm_resources_file" {
  type = string
}

variable "vcd_domain" {
  type = string
}

variable "vcd_allow_unverified_ssl" {
  type    = bool
  default = true
}

variable "vcd_edge_gateway_default" {
  type    = string
  default = ""
}

variable "vcd_catalog_name" {
  type    = string
  default = ""
}

variable "vcd_edge_cluster_default" {
  type    = string
  default = ""
}

variable "s3_rs_bucket" {
  type    = string
  default = ""
}

variable "s3_rs_key" {
  type    = string
  default = ""
}

variable "s3_rs_secret_key" {
  type    = string
  default = ""
}

variable "s3_rs_access_key" {
  type    = string
  default = ""
}

locals {
  ## VCD related vars
  vcd_cred_path_to_file         = "${var.vcd_config_dir}/${var.vcd_cred_file}"
  vcd_vm_resources_path_to_file = "${var.vcd_config_dir}/${var.vcd_vm_resources_file}"

  ## Predefined org settings
  vcd_org     = lookup(lookup(try(jsondecode(file(local.vcd_cred_path_to_file)), {}), var.vcd_domain, {}), "org")
  vcd_org_vdc = lookup(lookup(try(jsondecode(file(local.vcd_cred_path_to_file)), {}), var.vcd_domain, {}), "vdc")
  vcd_token   = lookup(lookup(try(jsondecode(file(local.vcd_cred_path_to_file)), {}), var.vcd_domain, {}), "token")
  vcd_url     = lookup(lookup(try(jsondecode(file(local.vcd_cred_path_to_file)), {}), var.vcd_domain, {}), "url")

  ## VM YAML file parsing
  vm_yaml = yamldecode(file(local.vcd_vm_resources_path_to_file))
}