variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "env" {
  description = "Environment tag"
  type        = string
  default     = "DEV"
}
