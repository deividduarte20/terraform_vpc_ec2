resource "aws_instance" "web" {
  ami                         = data.aws_ami.teste.id
  instance_type               = var.inst_type
  key_name                    = var.inst_key
  subnet_id                   = aws_subnet.subnet-tf.id
  vpc_security_group_ids      = [aws_security_group.sg-tf.id]
  associate_public_ip_address = true

  tags = {
    Name = "DevOps"
  }
}