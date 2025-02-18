# provider block for target account
provider "aws" {
  region = var.region

    assume_role {
    role_arn = "arn:aws:iam::${var.target_account_id}:role/github-actions-oidc-devsecops-terraform-sctv-loki-cdn-${var.env}"
  }
}


provider "awscc" {
  alias = "awscc-provider"
  region = var.region
  assume_role = {
    role_arn     = "arn:aws:iam::${var.target_account_id}:role/github-actions-oidc-devsecops-terraform-sctv-loki-cdn-${var.env}"
}
}