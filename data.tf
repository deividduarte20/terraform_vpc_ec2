data "aws_ami" "teste" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "amazon"
}

data "aws_iam_policy" "ec2policy" {
  arn = var.arn_aws_iam_policy
}
