#beanstalk
resource "aws_elastic_beanstalk_application" "pythonterradtcc" {
  name = "${var.project["project_name"]}"
  description = "test project"
}

resource "aws_elastic_beanstalk_application_version" "pythonterradtcc" {
  name = "pyterradtcc12"
  application = "${aws_elastic_beanstalk_application.pythonterradtcc.name}"
  description = "Version latest of app ${aws_elastic_beanstalk_application.pythonterradtcc.name}"
  bucket = "${aws_s3_bucket.s3-beanstalk.id}"
  key = "${aws_s3_bucket_object.pythonterradtcc.id}"

}

resource "aws_elastic_beanstalk_environment" "pythonterradtcc" {
  name = "pythonterradtcc"
  application = "${aws_elastic_beanstalk_application.pythonterradtcc.name}"
  solution_stack_name = "64bit Amazon Linux 2017.03 v2.5.1 running Python 3.4"
  tier = "WebServer"
  version_label = "pyterradtcc12"

}

