resource "aws_iam_user" "testuser" {
  count = 3
  name          = var.iam_names[count.index]
  path          = "/system/"
  force_destroy = true
}



resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = false
  allow_users_to_change_password = true
}
