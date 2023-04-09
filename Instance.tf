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
resourse "aws_instance" "Instane1"{
    ami="ami-0e38fa17744b2f6a5"
    instance_type="t2.micro"
}
output "public-ip"{
    value=aws_instance.Instance1.public_ip
}