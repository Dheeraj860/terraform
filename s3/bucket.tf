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
resource "aws_s3_bucket" "bucket1"{
    bucket = "ahvcvrv128976"
    tags ={
        Name= "practice-bucket"
    }
}
resource "aws_s3_bucket_acl" "acl"{
    bucket = aws_s3_bucket.bucket1.id
    acl = "public-read"
}
resource "aws_s3_object" "file1"{
    bucket = aws_s3_bucket.bucket1.id
    key = "file.txt"
    source = "D:\terraform\s3\file.txt"
    acl = "public-read"
    content_type = "text/plain"
}