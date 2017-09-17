#__     __  ____     ____
#\ \   / / |  _ \   / ___|
##\ \ / /  | |_) | | |
###\ V /   |  __/  | |___
####\_/    |_|      \____|

# Create a VPC to launch our instances into
resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc["cidr_block"]}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "${var.vpcName}"
    Environment = "${var.env}"
  }
}

output VPC {
  value = "${aws_vpc.main.id}"
}

