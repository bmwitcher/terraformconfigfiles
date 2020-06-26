provider "aws" {
  region     = "us-east-1"
  #storing credentials in the config files is not recommended
  #store provider details in a seperate file with  the sensitve = true value =
  access_key = "place  access key here"
  secret_key = "secret key"
}

variable "elb_names" {
  type = list 
  default = ["dev-loadbalancer", "stage-loadbalanacer","prod-loadbalancer"]
}

resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}
