module "vm" {
  count = length(local.vm_yaml.vms)

  source = "../itsf-infra-modules/vm"

  org     = local.vcd_org
  org_vdc = local.vcd_org_vdc

  yaml         = local.vm_yaml.vms[count.index]
  company      = local.vm_yaml.company
  project      = local.vm_yaml.project
  catalog_name = var.vcd_catalog_name


  s3_rs_access_key = var.s3_rs_access_key
  s3_rs_secret_key = var.s3_rs_secret_key
  s3_rs_bucket     = var.s3_rs_bucket
  s3_rs_key        = var.s3_rs_key
}