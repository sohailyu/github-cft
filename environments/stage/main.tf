resource "aws_s3_bucket" "test_bucket" {
  bucket = "test0990890"

  tags = {
    Name        = "test0990890"
    Environment = "Dev"
  }
}