resource "aws_vpc" "prod"{
    cidr_block = var.aws_cidr_block
    enable_dns_hostnames = true
    enable_dns_support = true
}

resource "aws_subnet" "prod_public" {
    vpc_id = aws_vpc.prod.id
    cidr_block = var.aws_public_subnet
    map_public_ip_on_launch = true
    tags = {
        Name = "prod_public_subnet"
    }
}

resource "aws_subnet" "prod_private" {
    vpc_id = aws_vpc.prod.id
    cidr_block = var.aws_private_subnet
    tags = {
        Name = "Prod_private_subnets"
    }

}

resource "aws_internet_gateway" "aws_igw_prod"{
    vpc_id = aws_vpc.prod.id
    tags = {
        Name = "aws_igw_prod"
    }

}

resource "aws_eip" "nat" {
  vpc = true
  
  tags = {
    Name = "prod-nat-eip"
  }
}

resource "aws_nat_gateway" "aws_ngw_prod"{
    allocation_id = aws_eip.nat.id 
    subnet_id = aws_subnet.prod_public.id
    tags = {
      Name = "aws_ngw_prod"
    }
    depends_on = [aws_internet_gateway.aws_igw_prod]
}

resource "aws_route_table" "aws_route_prod_public"{
    vpc_id = aws_vpc.prod.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.aws_igw_prod.id
    

    }
      tags = {
    Name = "prod-public-rt"
  }
}

resource "aws_route_table" "aws_route_prod_private"{
    vpc_id = aws_vpc.prod.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.aws_ngw_prod.id
    
    }
      tags = {
    Name = "prod-private-rt"
  }
}

resource "aws_route_table_association" "aws_routetable_public"{
    route_table_id = aws_route_table.aws_route_prod_public.id
    subnet_id = aws_subnet.prod_public.id

}
resource "aws_route_table_association" "aws_routetable_privatec"{
    route_table_id = aws_route_table.aws_route_prod_private.id
    subnet_id = aws_subnet.prod_private.id

}