resource "aws_instance" "myec2" {
ami = "ami-09d95fab7fff3776c"
#ami IS REGION SPECIFIC - please check which region you are in if you receive an error
instance_type = var.instance_type
}


resource "aws_eip" "elastictest" {
  vpc      = true
}


resource "aws_eip_association" "eip_assoc" {
  instance_id = aws_instance.myec2.id
  allocation_id = aws_eip.elastictest.id
  }


  resource "aws_security_group" "allow_tls" {
  name        = "practice-security-group"


  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.elastictest.public_ip}/32"]
    # cidr_blocks = [aws_eip.elastictest.public_ip/32] open this range up to allow more specific or general ip address
  }
}
