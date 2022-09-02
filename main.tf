resource "aws_instance" "web" {
  ami                         = data.aws_ami.teste.id
  instance_type               = var.inst_type
  key_name                    = var.inst_key
  subnet_id                   = aws_subnet.subnet-tf.id
  vpc_security_group_ids      = [aws_security_group.sg-tf.id]
  associate_public_ip_address = true
  iam_instance_profile        = 

  tags = {
    Name = "DevOps"
  }
}

# Configure IAM instance profile
 resource "aws_iam_instance_profile" "ec2-admin-role" {
   name = "instance_profile"
   role = aws_iam_role.iam-ec2-admin-role.name
 }

 # Configure IAM role
 resource "aws_iam_role" "iam-ec2-admin-role" {
   name                  = var.iam-role-name
   path                  = var.iam-role-path
   assume_role_policy    = data.aws_iam_policy_document.ec2-assume-role.json
   managed_policy_arns   = var.iam-role-policy-attachment
 }
