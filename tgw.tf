resource "aws_ec2_transit_gateway" "tgw" {}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment_a" {
  subnet_ids         = [aws_subnet.vpc_a_secondary_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_a.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment_b" {
  subnet_ids         = [aws_subnet.vpc_b_secondary_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_b.id
}
