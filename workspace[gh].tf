provider "aws" {
  region     = "us-east-1"
  #storing credentials in the config files is not recommended
  access_key = "place  access key here"
  secret_key = "secret key"
}

resource "aws_instance" "myec2" {
   ami = "ami-09d95fab7fff3776c"
   instance_type = lookup(var.instance_type,terraform.workspace)
}

#terraform recommends that you store all variables in a seperate configuration file to keep your code short and clean
variable "instance_type" {
  type = map

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod     = "t2.large"
  }
}
