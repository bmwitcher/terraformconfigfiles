provider "aws" {
  region     = "us-east-1"
  #storing credentials in the config files is not recommended
  #store provider details in a seperate file with  the sensitve = true value =
  access_key = "place  access key here"
  secret_key = "secret key"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    #values may be different based on the ami you want to provision
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "instance-1" {
    ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
}
