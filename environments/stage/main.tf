resource "aws_s3_bucket" "test_bucket" {
  bucket = "test0990890"

  tags = {
    Name        = "test0990890"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "test_bucket_policy" {
  bucket = aws_s3_bucket.test_bucket.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:user/specific-user"
      },
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::test0990890",
        "arn:aws:s3:::test0990890/*"
      ]
    }
  ]
}
POLICY
}
