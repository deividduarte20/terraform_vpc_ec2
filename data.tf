data "aws_ami" "teste" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "amazon"
}

data "aws_iam_role" "roles" {
  name = "AmazonSSMRoleForInstancesQuickSetup"
}
