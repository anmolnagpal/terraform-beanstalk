resource "aws_s3_bucket" "s3-beanstalk" {
  bucket = "${var.s3_bucker}"
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


resource "aws_s3_bucket_object" "python" {
  bucket = "${aws_s3_bucket.s3-beanstalk.id}"
  key = "${var.project["key"]}"
  source = "${var.project["source"]}"
}