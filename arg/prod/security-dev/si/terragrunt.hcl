include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../resources/sso/"
}

locals {
  custom_vars = yamldecode(file("custom_vars.yaml"))
  ps_name     = "ps_${local.custom_vars.account_id}_${basename(get_terragrunt_dir())}_${local.custom_vars.external == true ? "ext_" : ""}${local.custom_vars.contingency == true ? "cont_" : ""}tf"
}

inputs = {
  # inline_policy    = local.custom_vars.inline_policy
  aws_policies     = local.custom_vars.aws_policies
  ps_name          = local.ps_name
  description      = local.custom_vars.description
  session_duration = local.custom_vars.session_duration
  group_name       = local.custom_vars.group_name
  account_id       = local.custom_vars.account_id
  tags = {
    Owner        = local.custom_vars.owner
    Environment  = local.custom_vars.environment
    BusinessUnit = local.custom_vars.business_unit
  }
}
