variable "aws_account_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "domain" {
  type = string
}

variable "domain_certificate_arn" {
  type = string
}

variable "root_object" {
  type = string
  default = "index.html"
}

variable "price_class" {
  type = string
  default = "PriceClass_100"
}

variable "allowed_methods" {
  type = list(string)
  default = ["GET", "HEAD"]
}

variable "cached_methods" {
  type = list(string)
  default = ["GET", "HEAD"]
}
