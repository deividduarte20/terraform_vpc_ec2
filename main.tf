resource "aws_instance" "web" {
  ami                         = data.aws_ami.teste.id
  instance_type               = var.inst_type
  key_name                    = var.inst_key
  subnet_id                   = aws_subnet.subnet-tf.id
  vpc_security_group_ids      = [aws_security_group.sg-tf.id]
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_ssm_profile.name

  tags = {
    Name = "DevOps"
  }
}

resource "aws_iam_role" "ssmforec2" {
  name = "ssmforec2"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "ssmforec2-attach" {
  name       = "ssmforec2-attachment"
  roles      = [aws_iam_role.ssmforec2.name]
  policy_arn = data.aws_iam_policy.ec2policy.arn
}

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "ec2_ssm_profile"
  role = aws_iam_role.ssmforec2.name
}