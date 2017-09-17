provider "aws" {
  access_key = "XXX"
  secret_key = "XXX"
  region = "us-west-2"
}

resource "aws_s3_bucket" "python" {
  bucket = "python.applicationversion.bucket"
}

resource "aws_s3_bucket_object" "python" {
  bucket = "${aws_s3_bucket.python.id}"
  key    = "beanstalkpython/pyterra.zip"
  source = "pyterra.zip"
}
resource "aws_elastic_beanstalk_application" "python" {
  name = "python"
  description = "pythonterra"
}

resource "aws_elastic_beanstalk_application_version" "python" {
  name        = "pyterradtcc12"  
  application = "${aws_elastic_beanstalk_application.python.name}"
  description = "Version latest of app ${aws_elastic_beanstalk_application.python.name}"
  bucket      = "${aws_s3_bucket.python.id}"
  key         = "${aws_s3_bucket_object.python.id}"

}

resource "aws_elastic_beanstalk_environment" "python" {
  name                  = "python"
  application           = "${aws_elastic_beanstalk_application.python.name}"
  solution_stack_name   = "64bit Amazon Linux 2017.03 v2.5.1 running Python 3.4"
  tier                  = "WebServer" 
  version_label         = "pyterradtcc12"
  
}



