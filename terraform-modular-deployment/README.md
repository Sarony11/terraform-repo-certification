# Working with Modules Deployments
In terraform-local-docker, we have been working only the ROOT MODULE and a few files.

What we are going to do now, is to setup our Terraform infrastructure using modules and nested modules.

## Terraform Graph
Terraform graph relates all the resources in Terraform. Exporting this data to a graph allow us to follow the resources used.

First, we need to install graphviz
``
sudo apt install graphviz
``
Once installed, we can run the following command to export the data.
``
terraform graph | dot -Tpdf > graph-plan.pdf # This exports to a pdf file called graph-plan.pdf the information extracted from terraform graph and makes it legible.
``
### Implicit Dependencies
In order to create a dependency between 2 objects without it (but that they really need each other) we can do it implicit, adding a variable from one of the objets to the oter.

For instance, in our case we can add the volume id to be part of the container name. This way, when the container is created, it will request the volume id and without it, it will no be created and an error message will appear.

This relation will be also visible in our terraform graph, relating one object to the other.

### Explicit Dependencies (Easier)
Using a new argument, depends_on = [resource_name] you can explicit indicates that resources is depending in another one.

For instance, we will add depends_on = [null_resource.dockervol] to indicate this dependency, inside the docker_container - nodered_container resource.