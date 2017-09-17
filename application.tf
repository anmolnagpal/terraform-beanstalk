#beanstalk

resource "aws_elastic_beanstalk_application" "python" {
  name = "${var.project["name"]}"
  description = "test project"
}

resource "aws_elastic_beanstalk_application_version" "python" {
  name = "python"
  application = "${aws_elastic_beanstalk_application.python.name}"
  description = "Version latest of app ${aws_elastic_beanstalk_application.python.name}"
  bucket = "${aws_s3_bucket.s3-beanstalk.id}"
  key = "${aws_s3_bucket_object.python.id}"

}

resource "aws_elastic_beanstalk_environment" "python" {
  name = "python"
  application = "${aws_elastic_beanstalk_application.python.name}"
  solution_stack_name = "64bit Amazon Linux 2017.03 v2.5.1 running Python 3.4"
  tier = "WebServer"
  version_label = "${var.project["version"]}"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${aws_vpc.main.id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${aws_subnet.subnet-a.id}"
  }

}
