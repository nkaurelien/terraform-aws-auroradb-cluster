# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# variable "aws_access_key" {
#   description = "The IAM public access key"
# }

# variable "aws_secret_key" {
#   description = "IAM secret access key"
# }

variable "aws_region" {
  default     = "us-west-2"
  description = "The AWS region things are created in"
}


variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}


variable "database_name" {
  type = string
  # default = ""
}

variable "database_username" {
  type        = string
  default     = "testAdmin"
  nullable    = false
  description = "The master user name for the database"
}

variable "database_password" {
  type        = string
  nullable    = false
  sensitive   = true
  description = "The (master) password for the database master user can include any printable ASCII character except /, ', \", @, or a space. For Oracle, & is an additional character limitation."
}
