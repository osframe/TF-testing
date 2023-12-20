resource "aws_security_group" "ssh-inbound" {
  description = "allows ssh access from safe IP-range"
  vpc_id      = aws_vpc.my_vpc.id
  name        = "ssh-inbound"
  tags        = local.all_tags
}

resource "aws_vpc_security_group_ingress_rule" "ssh-ingress" {
  security_group_id = aws_security_group.ssh-inbound.id

  cidr_ipv4   = "${var.my_ip}/32"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "ssh-egress" {
  security_group_id = aws_security_group.ssh-inbound.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}


resource "aws_security_group" "lb-http-inbound" {
  description = "allows http access from safe IP-range to a LoadBalancer"
  vpc_id      = aws_vpc.my_vpc.id
  name        = "lb-http-inbound"
  tags        = local.all_tags
}

resource "aws_vpc_security_group_ingress_rule" "lb-http-ingress" {
  security_group_id = aws_security_group.lb-http-inbound.id

  cidr_ipv4   = "${var.my_ip}/32"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "lb-http-egress" {
  security_group_id = aws_security_group.lb-http-inbound.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}

resource "aws_security_group" "http-inbound" {
  description = "allows http access from LoadBalancer"
  vpc_id      = aws_vpc.my_vpc.id
  name        = "http-inbound"
  tags        = local.all_tags
}

resource "aws_security_group_rule" "http-ingress" {
  security_group_id = aws_security_group.http-inbound.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"

  source_security_group_id = aws_security_group.lb-http-inbound.id
}


resource "aws_vpc_security_group_egress_rule" "http-egress" {
  security_group_id = aws_security_group.http-inbound.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}