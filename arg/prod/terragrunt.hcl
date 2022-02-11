remote_state {
  backend = "s3"
  config = {
    bucket         = "XXX-arg-security-sso-prod-tfstate"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "XXX-arg-security-sso-prod-tfstate-lock"
  }
}

locals {
  common_vars = yamldecode(file("common_vars.yaml"))
}

inputs = {
  region          = local.common_vars.region
  assume_role_arn = local.common_vars.assume_role_arn
}
