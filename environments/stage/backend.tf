terraform {
  backend "s3" {
    bucket         = "terraform-state-s3bucket-sctv-loki-cdn-shared"
    key            = "terraform/sctv-loki-monitor/stage/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-table-sctv-loki-cdn-shared"
    region         = "us-west-2"
    acl            = "bucket-owner-full-control"
  }
}