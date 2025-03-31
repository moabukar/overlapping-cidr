resource "aws_eip" "eip_a" {}

resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.eip_a.id
  subnet_id     = aws_subnet.vpc_a_secondary_subnet.id
}

resource "aws_eip" "eip_b" {}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.eip_b.id
  subnet_id     = aws_subnet.vpc_b_secondary_subnet.id
}
