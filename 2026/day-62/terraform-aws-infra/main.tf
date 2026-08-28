# 1. Main Virtual Private Cloud (VPC)
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "TerraWeek-VPC"
  }
}

# 2. Public Subnet inside the VPC
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "TerraWeek-Public-Subnet"
  }
}

# 3. Internet Gateway to connect the VPC to the outside world
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "TerraWeek-IGW"
  }
}

# 4. Route Table pointing to the Internet Gateway for public traffic
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "TerraWeek-Public-Route-Table"
  }
}

# 5. Route Table Association connecting the public subnet to the route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# 6. Security Group allowing SSH (22) and HTTP (80) inbound, and all outbound traffic
resource "aws_security_group" "web_sg" {
  name        = "TerraWeek-SG"
  description = "Allow inbound traffic for SSH and HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TerraWeek-SG"
  }
}

# 7. EC2 Instance deployed in the public subnet with a public IP
resource "aws_instance" "web" {
  ami                         = "ami-0c7217cdde317cfec"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "TerraWeek-Server"
  }
}

# 8. Secondary S3 bucket for application logs with an explicit dependency
resource "aws_s3_bucket" "app_logs" {
  bucket        = "terraweek-app-logs-bucket-${aws_vpc.main.id}"
  force_destroy = true

  # Explicit dependency demonstration: force this bucket to be created after the EC2 instance
  depends_on = [aws_instance.web]

  tags = {
    Name = "TerraWeek-App-Logs"
  }
}
