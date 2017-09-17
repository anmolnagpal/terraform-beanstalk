##__  __ ___ ____   ____     ____  _   _ ____  _   _ _____ _____
#|  \/  |_ _/ ___| / ___|   / ___|| | | | __ )| \ | | ____|_   _|
#| |\/| || |\___ \| |   ____\___ \| | | |  _ \|  \| |  _|   | |
#| |  | || | ___) | |__|_____|__) | |_| | |_) | |\  | |___  | |
#|_|  |_|___|____/ \____|   |____/ \___/|____/|_| \_|_____| |_|

# Subnet VPC
variable "subnet-dev-misc-a" {
  type    = "map"
  default = {
    cidr_block = "10.250.0.0/20"
  }
}
variable "subnet-dev-misc-b" {
  type    = "map"
  default = {
    cidr_block = "10.250.16.0/20"
  }
}
variable "subnet-dev-misc-c" {
  type    = "map"
  default = {
    cidr_block = "10.250.32.0/20"
  }
}


# Subnets with AZ-A
resource "aws_subnet" "subnet-dev-misc-a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.subnet-dev-misc-a["cidr_block"]}"
  availability_zone = "${var.region}a"

  tags {
    Name        = "subnet-dev-misc-${var.env}-sn"
    Environment = "${var.env}"
  }
}

# Subnets with AZ-A
resource "aws_subnet" "subnet-dev-misc-b" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.subnet-dev-misc-b["cidr_block"]}"
  availability_zone = "${var.region}b"

  tags {
    Name        = "subnet-dev-misc-${var.env}-sn"
    Environment = "${var.env}"
  }
}

# Subnets with AZ-A
resource "aws_subnet" "subnet-dev-misc-c" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.subnet-dev-misc-c["cidr_block"]}"
  availability_zone = "${var.region}c"

  tags {
    Name        = "subnet-dev-misc-${var.env}-sn"
    Environment = "${var.env}"
  }
}


##  route table association
resource "aws_route_table" "subnet-dev-misc-rt-a" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name        = "subnet-dev-misc-${var.env}-rt-a"
    Environment = "${var.env}"
  }
}


# route table association Zone-A
resource "aws_route_table_association" "subnet-dev-misc-rta-a" {
  subnet_id      = "${aws_subnet.subnet-dev-misc-a.id}"
  route_table_id = "${aws_route_table.subnet-dev-misc-rt-a.id}"
}


##  route table association
resource "aws_route_table" "subnet-dev-misc-rt-b" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name        = "subnet-dev-misc-${var.env}-rt-b"
    Environment = "${var.env}"
  }
}


# route table association Zone-A
resource "aws_route_table_association" "subnet-dev-misc-rta-b" {
  subnet_id      = "${aws_subnet.subnet-dev-misc-b.id}"
  route_table_id = "${aws_route_table.subnet-dev-misc-rt-b.id}"
}


##  route table association
resource "aws_route_table" "subnet-dev-misc-rt-c" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name        = "subnet-dev-misc-${var.env}-rt-c"
    Environment = "${var.env}"
  }
}


# route table association Zone-A
resource "aws_route_table_association" "subnet-dev-misc-rta-c" {
  subnet_id      = "${aws_subnet.subnet-dev-misc-c.id}"
  route_table_id = "${aws_route_table.subnet-dev-misc-rt-c.id}"
}
