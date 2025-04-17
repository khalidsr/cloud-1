output "droplet_ip_address" {
    value = [for droplet in digitalocean_droplet.webservers : droplet.ipv4_address]
}