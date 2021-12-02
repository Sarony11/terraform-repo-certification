variable "name_in" {
    description = "Container name."
}

variable "image_in" {
    description = "Image."
}

# Ports
variable "int_port_in" {
    description = "Internal port definition."
}

variable "ext_port_in" {
    description = "External port definition."
}

# Volumes
variable "container_path_in" {
    description = "Container path."
}