provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-handson"
  }
}

resource "aws_subnet" "aws-tf-public-subnet" {
    vpc_id           = aws_vpc.main.id
    cidr_block      = "10.0.0.0/24"
    tags = {
        Name = "aws-tf-public-subnet"
    }
}

resource "aws_subnet" "aws-tf-private-subnet" {
    vpc_id           = aws_vpc.main.id
    cidr_block      = "10.0.1.0/24"
    tags = {
        Name = "aws-tf-private-subnet"
    }
}

resource "aws_internet_gateway" "aws-tf-igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "aws-tf-igw"
  }
}