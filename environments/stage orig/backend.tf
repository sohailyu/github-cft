terraform {
  backend "s3" {
    bucket         = "github-s3-backend"
    key            = "github-s3-backend/stage/terraform.tfstate"
    #dynamodb_table = "terraform-state-lock-table-sctv-loki-cdn-shared"
    region         = "us-east-2"
    acl            = "bucket-owner-full-control"
  }
}