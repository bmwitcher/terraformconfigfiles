#creating an iam_user in the remote back (terraform cloud) end default is the local backend
terraform {
  required_version = "~> 0.12.0"

  backend "remote" {}
}

resource "aws_iam_user" "lb" {
  name = "remoteuser"
  path = "/system/"
}
