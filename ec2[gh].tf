provider "aws" {
  region     = "us-east-1"
#storing credentials in the config files is not recommended
  access_key = "place  access key here"
  secret_key = "secret key"
}

resource "aws_instance" "myec2" {
#ami are specific to the region you want to deploy infrastructure in
ami = "ami-09d95fab7fff3776c"
instance_type = "t2.micro"
}
