variable "env" {
  type        = string
  description = "Env where to deploy to."
  default     = "dev"
}

variable "image" {
  type        = map(any)
  description = "Image for container."
  default = {
    dev  = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}

variable "ext_port" {
  type = map(any)

  /* validation {
    condition     = max(var.ext_port...) <= 65535 && min(var.ext_port...) > 0
    error_message = "The external port must be in the valid port range 0 - 65535."
  } */
}

variable "int_port" {
  type    = number
  default = 1880
  # sensitive = true # This atribute becomes the value in sensitive and prevents to show up in CLI or as output.

  validation {
    condition     = var.int_port == 1880
    error_message = "The internal port must be 1880."
  }
}

variable "container_count" {
  type    = number
  default = 3
}

# Definition local values
locals {
  container_count = length(var.ext_port)
}

