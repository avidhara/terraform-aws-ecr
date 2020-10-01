variable "tags" {
  type = map(string)
  default = {
    "Managed By" = "Terraform"
  }
}

variable "repository_names" {
  type        = list
  description = "Name of the repositories "
  default     = ["example1", "example2"]
}

variable "org_unit" {
  type        = string
  description = "Name of the Project/Org unit"
  default     = "example"
}

variable "image_tag_mutability" {
  type        = string
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE"
  default     = "IMMUTABLE"
}

variable "scan_on_push" {
  type        = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
  default     = true
}

variable "max_untagged_image_count" {
  type        = number
  description = "The maximum number of untagged images that you want to retain in repository."
  default     = 3
}

variable "max_tagged_image_count" {
  type        = number
  description = "The maximum number of tagged images that you want to retain in repository."
  default     = 60
}


######## 
variable "identifiers" {
  type        = list
  description = "(Required) List of identifiers for principals. these are IAM user or role ARNs."
  default = [

  ]
}