# https://www.terraform.io/docs/language/values/variables.html#variable-definitions-tfvars-files
#
ext_port = {
  dev  = [1880, 1881] # This definition assign ext_port value to ext_port variable
  prod = [1990, 1991]
}