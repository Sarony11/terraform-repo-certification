## Terraform console
You can type "terraform console" to activate the terraform CLI and execute commands. Useful for debuging or troubleshooting
 
## Apply different tfvars files`
https://www.udemy.com/course/terraform-certified/learn/lecture/25115346?start=90#overview

With this command you can specifiy which definition file use to define variables. This way you can have multiple definition files for multiple specific environments.
``
terraform plan --var-file=terraform.tfvars
``
_For instance:_
``
terraform plan --var-file=aws_us_east_01.tfvars
terraform plan --var-file=aws_eu_central-01.tfvars
``
## Hidding sensitive variables from CLI
https://www.udemy.com/course/terraform-certified/learn/lecture/23640518#overview

We can add the atribute sensitive = true to hidden a variable value from the CLI. 
_Note: It is not possible to output a sensitive variable, and terraform will give you an error. To overcome this problem, the output has to be deleted or sensistive = true atribute has to be added to the output too._

## Local Values
https://www.udemy.com/course/terraform-certified/learn/lecture/23514638#overview
https://www.terraform.io/docs/configuration/locals.html

Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration, but if overused they can also make a configuration hard to read by future maintainers by hiding the actual values used.

Use local values only in moderation, in situations where a single value or result is used in many places and that value is likely to be changed in future. The ability to easily change the value in a central place is the key advantage of local values.

## Expand Expression
https://www.udemy.com/course/terraform-certified/learn/lecture/23514644#overview

Allow us the expand a list in a group of numbers to operate with them. This way, we can use functions like min() or max() which does not work with list.

## Maps and Lookups for multiple environments
https://www.udemy.com/course/terraform-certified/learn/lecture/23524510#overview
https://www.terraform.io/docs/language/functions/lookup.html
https://www.terraform.io/docs/language/functions/map.html
https://www.pachehra.com/2019/07/terraform-maps-and-lookups.html
Mapping variables is useful when defining variables than can have multiple values depending other variables, like the environment (env,prod), This way, we can map several variables to the several environments and call the function lookup to get the actual value.

_lookup(var.image,var.env)_

## Terraform workspaces
In terraform, workspaces allow you to have multiple states, one by workspaces. At the same time, you can use the variable terraform.workspace in your terraform files to reference to the workspace and using it as a environment variable.

These are some useful commands to know.
``
terraform workspace list # List workspaces created
terraform workspace show # Shows the current workspace
terraform workspace new <new_workspace> # Creates a new workspace and moves to there
terraform workspace select <workspace_name> # Moves to the selected workspace
``

_For instance_
``
terraform workspace new prod
terraform workspace new dev
terraform apply --auto-approve -var="env=dev"
terraform workspace select prod
terraform apply --auto-approve -var="env=prod"
``
