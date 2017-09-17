variable "vpcName" {
  default = "test-vpc"
  description = "Vpc Name"
}

variable "env" {
  default = "test"
  description = "Environment Name"
}

variable "region" {
  default = "us-west-2"
  description = "Environment Name"
}

variable "s3_bucker" {
  default = "beanstalk"
}

variable "project" {
  type = "map"
  default = {
    name = "python"
    version = "1.0"
    key = "beanstalk/python.zip"
    source = "python.zip"
  }
}

variable "vpc" {
  type = "map"
  default = {
    cidr_block = "10.250.0.0/16"
  }
}