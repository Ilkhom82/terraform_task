resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true" 
  enable_dns_hostnames = "true" 

  tags = local.common_tags

}


resource "aws_subnet" "subnet-public-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" 
  availability_zone       = "us-east-1a"

  tags = local.common_tags
}

resource "aws_subnet" "subnet-public-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true" 
  availability_zone       = "us-east-1b"

  tags = local.common_tags
}

resource "aws_subnet" "subnet-public-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true" 
  availability_zone       = "us-east-1c"

  tags = local.common_tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = local.common_tags
}

resource "aws_route_table" "public-crt" {
  vpc_id = aws_vpc.vpc.id

  route {
  
    cidr_block = "0.0.0.0/0"
   
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = local.common_tags
}

resource "aws_route_table_association" "crta-public-subnet-1" {
  subnet_id      = aws_subnet.subnet-public-1.id
  route_table_id = aws_route_table.public-crt.id
}

resource "aws_route_table_association" "crta-public-subnet-2" {
  subnet_id      = aws_subnet.subnet-public-2.id
  route_table_id = aws_route_table.public-crt.id
}

resource "aws_route_table_association" "crta-public-subnet-3" {
  subnet_id      = aws_subnet.subnet-public-3.id
  route_table_id = aws_route_table.public-crt.id
}
