##__  __ ___ ____   ____     ____  _   _ ____  _   _ _____ _____
#|  \/  |_ _/ ___| / ___|   / ___|| | | | __ )| \ | | ____|_   _|
#| |\/| || |\___ \| |   ____\___ \| | | |  _ \|  \| |  _|   | |
#| |  | || | ___) | |__|_____|__) | |_| | |_) | |\  | |___  | |
#|_|  |_|___|____/ \____|   |____/ \___/|____/|_| \_|_____| |_|

# Subnet VPC
variable "subnet-a" {
  type    = "map"
  default = {
    cidr_block = "10.250.0.0/20"
  }
}
variable "subnet-b" {
  type    = "map"
  default = {
    cidr_block = "10.250.16.0/20"
  }
}
variable "subnet-c" {
  type    = "map"
  default = {
    cidr_block = "10.250.32.0/20"
  }
}


# Subnets with AZ-A
resource "aws_subnet" "subnet-a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.subnet-a["cidr_block"]}"
  availability_zone = "${var.region}a"

  tags {
    Name        = "subnet-${var.env}-sn"
    Environment = "${var.env}"
  }
}

# Subnets with AZ-A
resource "aws_subnet" "subnet-b" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.subnet-b["cidr_block"]}"
  availability_zone = "${var.region}b"

  tags {
    Name        = "subnet-${var.env}-sn"
    Environment = "${var.env}"
  }
}

# Subnets with AZ-A
resource "aws_subnet" "subnet-c" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.subnet-c["cidr_block"]}"
  availability_zone = "${var.region}c"

  tags {
    Name        = "subnet-${var.env}-sn"
    Environment = "${var.env}"
  }
}


##  route table association
resource "aws_route_table" "subnet-a" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name        = "${var.env}-subnet-a"
    Environment = "${var.env}"
  }
}


# route table association Zone-A
resource "aws_route_table_association" "subnet-a" {
  subnet_id      = "${aws_subnet.subnet-a.id}"
  route_table_id = "${aws_route_table.subnet-a.id}"
}


##  route table association
resource "aws_route_table" "subnet-b" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name        = "${var.env}-subnet-b"
    Environment = "${var.env}"
  }
}


# route table association Zone-A
resource "aws_route_table_association" "subnet-b" {
  subnet_id      = "${aws_subnet.subnet-b.id}"
  route_table_id = "${aws_route_table.subnet-b.id}"
}


##  route table association
resource "aws_route_table" "subnet-c" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name        = "subnet-${var.env}-c"
    Environment = "${var.env}"
  }
}


# route table association Zone-A
resource "aws_route_table_association" "subnet-c" {
  subnet_id      = "${aws_subnet.subnet-c.id}"
  route_table_id = "${aws_route_table.subnet-c.id}"
}
