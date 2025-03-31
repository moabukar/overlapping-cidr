resource "aws_route_table" "rtb_a" {
  vpc_id = aws_vpc.vpc_a.id
}

resource "aws_route" "route_a_to_b" {
  route_table_id         = aws_route_table.rtb_a.id
  destination_cidr_block = var.vpc_b_secondary_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.tgw.id
}

resource "aws_route_table_association" "assoc_a" {
  subnet_id      = aws_subnet.vpc_a_primary_subnet.id
  route_table_id = aws_route_table.rtb_a.id
}

resource "aws_route_table" "rtb_b" {
  vpc_id = aws_vpc.vpc_b.id
}

resource "aws_route" "route_b_to_a" {
  route_table_id         = aws_route_table.rtb_b.id
  destination_cidr_block = var.vpc_a_secondary_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.tgw.id
}

resource "aws_route_table_association" "assoc_b" {
  subnet_id      = aws_subnet.vpc_b_primary_subnet.id
  route_table_id = aws_route_table.rtb_b.id
}
