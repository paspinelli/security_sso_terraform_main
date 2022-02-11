variable "ps_name" {
  description = "The name of the Permission Set"
  type        = string
}

variable "description" {
  description = "The description of the Permission Set"
  type        = string
}

variable "session_duration" {
  description = "The length of time that the application user sessions are valid in the ISO-8601 standard"
  default     = "PT12H"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "inline_policy" {
  description = "The IAM inline policy to attach to a Permission Set"
  type        = string
  default     = null
}

variable "group_name" {
  description = "Identity provider group name"
}

variable "account_id" {
  description = "AWS account ID for permission set"
}

variable "aws_policies" {
  description = "The IAM managed policy Amazon Resource Name (ARN) to be attached to the Permission Set"
  default     = []
  type        = list(string)
}
