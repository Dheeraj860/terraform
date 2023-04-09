terraform{
    required_providers{
        aws={
            source="hashicorp/aws"
        }
    }
}
provider "aws"{
   region="us-east-1"
   access_key=""
   secret_key=""
}
resource "aws_vpc" "main_vpc"{
    cidr_block="18.0.0.0/20"
    tags ={
        Name= "Main-VPC"
    }
}
resource "aws_subnet" "Public_subnet"{
  vpc_id=aws-vpc.main_vpc.id
  cidr_block="18.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags ={
      Name="public-subnet"
  }
}
resource "aws_subnet" "private_subnet"{
  vpc_id=aws-vpc.main_vpc.id
  cidr_block="18.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags ={
      Name="private-subnet"
  }
}