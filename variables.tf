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
