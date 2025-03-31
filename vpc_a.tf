resource "aws_vpc" "vpc_a" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_vpc_ipv4_cidr_block_association" "vpc_a_secondary" {
  vpc_id     = aws_vpc.vpc_a.id
  cidr_block = var.vpc_a_secondary_cidr
}

resource "aws_subnet" "vpc_a_primary_subnet" {
  vpc_id                  = aws_vpc.vpc_a.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 1)
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true
}

resource "aws_subnet" "vpc_a_secondary_subnet" {
  vpc_id                  = aws_vpc.vpc_a.id
  cidr_block              = cidrsubnet(var.vpc_a_secondary_cidr, 4, 1)
  availability_zone       = var.availability_zone_a
}
