variable "instance_type" {
  default = "t2.micro"
}


variable "iam_names" {
  type = list
  default = ["dev-user", "stage-user","prod-user"]
}
