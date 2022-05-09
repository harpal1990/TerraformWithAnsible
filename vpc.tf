resource "aws_vpc" "TechVPC" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostNames
  tags = {
    Name = "Tech VPC"
  }
}

resource "aws_subnet" "TechVPC_Pub_SN" {
  vpc_id                  = aws_vpc.TechVPC.id
  cidr_block              = var.PubsubnetCIDRblock
  map_public_ip_on_launch = true
  availability_zone       = var.availabilityZone
  tags = {
    Name = "Tech VPC Pub Subnet"
  }
}

resource "aws_subnet" "TechVPC_Pvt_SN" {
  vpc_id                  = aws_vpc.TechVPC.id
  cidr_block              = var.PvtsubnetCIDRblock
  map_public_ip_on_launch = true
  availability_zone       = var.availabilityZone
  tags = {
    Name = "Tech VPC Pvt Subnet"
  }
}

### Creating Security Group ###
resource "aws_security_group" "TechVPC_SG" {
  name        = "Web_SG"
  description = "Security Group for Web"
  vpc_id      = aws_vpc.TechVPC.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "Port for SG"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_internet_gateway" "TechVPC_IGT" {
  vpc_id = aws_vpc.TechVPC.id
  tags = {
    Name = "Tech VPC Internet Gateway"
  }
}

resource "aws_route_table" "TechVPC_Route_Table" {
  vpc_id = aws_vpc.TechVPC.id
  tags = {
    "Name" = "Tech VPC Route Table"
  }
}

resource "aws_route" "TechVPC_Resource" {
  route_table_id         = aws_route_table.TechVPC_Route_Table.id
  destination_cidr_block = var.destinationCIDRblock
  gateway_id             = aws_internet_gateway.TechVPC_IGT.id
}

resource "aws_route_table_association" "TechVPC_association" {
  subnet_id      = aws_subnet.TechVPC_Pub_SN.id
  route_table_id = aws_route_table.TechVPC_Route_Table.id
}