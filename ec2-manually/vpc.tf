resource "aws_vpc" "main" {
  cidr_block = var.aws_vpc
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.aws_vpc_private

}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main
}

resource "aws_nat_gateway" "natgateway" {
 subnet_id = var.aws_vpc_private
}

resource "aws_route_table" "routetable" {
    vpc_id = var.aws_vpc

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gateway
    }
}

resource "aws_route_table_association" "routetable" {
  route_table_id = aws_route.routetable
}
