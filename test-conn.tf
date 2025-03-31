variable "key_name" {
  default = "test-key-pair"
}

resource "aws_instance" "vm_a" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.vpc_a_primary_subnet.id
  key_name      = var.key_name
  tags = {
    Name = "vm-a"
  }
  associate_public_ip_address = true
}

resource "aws_instance" "vm_b" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.vpc_b_primary_subnet.id
  key_name      = var.key_name
  tags = {
    Name = "vm-b"
  }
  associate_public_ip_address = true
}

resource "aws_security_group" "allow_icmp" {
  name        = "allow-icmp"
  description = "Allow ICMP"
  vpc_id      = aws_vpc.vpc_a.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_network_interface_sg_attachment" "vm_a_icmp" {
  security_group_id    = aws_security_group.allow_icmp.id
  network_interface_id = aws_instance.vm_a.primary_network_interface_id
}

resource "aws_network_interface_sg_attachment" "vm_b_icmp" {
  security_group_id    = aws_security_group.allow_icmp.id
  network_interface_id = aws_instance.vm_b.primary_network_interface_id
}

### ssh -i ~/.ssh/test-key-pair.pem ec2-user@<VM-A Public IP>

