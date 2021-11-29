/* output "container-name" {
    value = docker_container.nodered_container[*].name
    description = "The name of the container"
}
 output "ip-address" {
  value       = [for i in docker_container.nodered_container[*]: join(":", [i.ip_address],i.ports[*]["external_ip"])
  sensitive   = true
  description = "The IP address and external por of the container"
}
  */