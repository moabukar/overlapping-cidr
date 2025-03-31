resource "aws_vpc" "vpc_b" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_vpc_ipv4_cidr_block_association" "vpc_b_secondary" {
  vpc_id     = aws_vpc.vpc_b.id
  cidr_block = var.vpc_b_secondary_cidr
}

resource "aws_subnet" "vpc_b_primary_subnet" {
  vpc_id                  = aws_vpc.vpc_b.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 2)
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = true
}

resource "aws_subnet" "vpc_b_secondary_subnet" {
  vpc_id                  = aws_vpc.vpc_b.id
  cidr_block              = cidrsubnet(var.vpc_b_secondary_cidr, 4, 1)
  availability_zone       = var.availability_zone_b
}
