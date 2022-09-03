variable "inst_type" {
  type        = string
  description = "Type of instance"
  default     = "t2.micro"
}

variable "inst_key" {
  type        = string
  description = "Key .pem for access"
  default     = "deividdua"
}

variable "arn_aws_iam_policy" {
  type        = string
  description = "arn da policy"
  default     = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"  
}