provider "aws" {
  region     = "us-east-1"
  #storing credentials in the config files is not recommended
  #store provider details in a seperate file with  the sensitve = true value =
  access_key = "place  access key here"
  secret_key = "secret key"
}

resource "aws_instance" "myec2" {
  #ami region specific
ami = "ami-09d95fab7fff3776c"
instance_type = "t2.micro"
}
