variable "vpcName" {
  default = "test-vpc"
  description = "Vpc Name"
}

variable "env" {
  default = "test"
  description = "Environment Name"
}

variable "region" {
  default = "eu-west-1"
  description = "Environment Name"
}

variable "s3_bucket" {
  default = "beanstalkpython"
}

variable "project" {
  type = "map"
  default = {
    name = "python"
    key = "beanstalkpython/pyterra.zip"
    source = "pyterra.zip"
  }
}

variable "vpc" {
  type = "map"
  default = {
    cidr_block = "10.250.0.0/16"
  }
}