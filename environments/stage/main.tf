module "new-module" {
  source                    = "../../modules/new-module"
  providers = {
    awscc.awsccnew =  awscc.awscc-provider
  }
}
