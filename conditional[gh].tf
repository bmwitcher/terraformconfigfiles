provider "aws" {
  region     = "us-east-1"
  #storing credentials in the config files is not recommended
  #store provider details in a seperate file with  the sensitve = true value =
  access_key = "place  access key here"
  secret_key = "secret key"
}

variable "istest" {}

resource "aws_instance" "dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
}
