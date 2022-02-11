variable "region" {
  description = "AWS Region"
  default     = "us_east-1"
  type        = string
}

variable "assume_role_arn" {
  description = "ARN rol who is going to assume on atlantis"
}
