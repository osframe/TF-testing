resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.0.0/16"

  tags = local.vpc_tags
}

resource "aws_internet_gateway" "My-IGW" {
  vpc_id = aws_vpc.my_vpc.id

  tags = local.igw_tags
}

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.My-IGW.id
  }

  tags = local.rt_tags
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name      = "${var.student_name}-01-subnet-public-${substr(var.availability_zones[count.index], length(var.availability_zones[count.index]) - 1, 1)}"
    Terraform = "True"
    Owner     = "${var.student_name}"
  }
}