##___    ____  __        __
#|_ _|  / ___| \ \      / /
##| |  | |  _   \ \ /\ / /
##| |  | |_| |   \ V  V /
#|___|  \____|    \_/\_/

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name        = "igw-${var.env}"
    Environment = "${var.env}"
  }
}
