output "arn" {
  value = aws_instance.web.arn
}

output "id" {
  value = aws_instance.web.id
}

output "ip_public" {
  value = aws_instance.web.public_ip
}