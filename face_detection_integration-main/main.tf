provider "aws"{

  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "os1"{

  ami = "ami-010aff33ed5991201"
  instance_type = "t2.micro"

}

resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 8

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "ebs_att" {

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.os1.id

}