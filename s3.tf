resource "aws_s3_bucket" "beanstalk" {
  bucket = "anmolbeanstalk"
  region = "${var.region}"
  acl = "private"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1447315810824",
  "Statement": [
    {
      "Sid": "Stmt1447315805704",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::anmolbeanstack/*"
    }
  ]
}
POLICY
}