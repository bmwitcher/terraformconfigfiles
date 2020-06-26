provider "aws" {
  region     = "var.region"
  #storing credentials in the config files is not recommended
  #store provider details in a seperate file with  the sensitve = true value =
  access_key = "place  access key here"
  secret_key = "secret key"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

#store variable files in sperate config file
variable "ami" {
  type = map
  default = {
    #ami region specific
    "us-east-1" = "ami-0323c3dd2da7fb37d"
    "us-west-2" = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  #must have file with pub key contents in order for this to work
  public_key = file("awskey.pub")
}
resource "aws_instance" "app-dev" {
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   key_name = aws_key_pair.loginkey.key_name
   count = 2

   tags = {
     Name = element(var.tags,count.index)
   }
}


output "timestamp" {
  value = local.time
}
