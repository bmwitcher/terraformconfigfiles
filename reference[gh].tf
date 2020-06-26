provider "aws" {
  region     = "us-east-1"
  #storing credentials in the config files is not recommended
  #store provider details in a seperate file with  the sensitve = true value =
  access_key = "place  access key here"
  secret_key = "secret key"
}

resource "aws_instance" "myec2" {
ami = "ami-09d95fab7fff3776c"
instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
  }

  resource "aws_security_group" "allow_tls" {
  name        = "kplabs-security-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
    # cidr_blocks = [aws_eip.lb.public_ip/32]

  }
}
