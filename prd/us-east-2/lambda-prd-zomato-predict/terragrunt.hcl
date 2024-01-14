include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/lambda_with_docker_and_url.hcl"
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  env      = local.env_vars.locals.environment

  name = "zomato-predict"
}

inputs = {
  name                = "lambda-${local.env}-${local.name}"
  role_arn            = "arn:aws:iam::959455567195:role/role-prd-zomato-predict-lambda"
  ecr_repository_name = "ecr-prd-zomato-predict-lambda"
  image_tag = "latest"
}