variable "vpcName" {
  default     = "test-vpc"
  description = "Vpc Name"
}

variable "env" {
  default     = "test"
  description = "Environment Name"
}

variable "region" {
  default     = "eu-west-1"
  description = "Environment Name"
}

variable "s3_bucker" {
  default     = "pythonterradtcc"
  description = "S3 Bucker Name"
}

variable "vpc" {
  type    = "map"
  default = {
    cidr_block = "10.100.0.0/16"
  }
}