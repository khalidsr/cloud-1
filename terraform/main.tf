resource "digitalocean_droplet" "webservers" {

    count  = 2
    image = "ubuntu-20-04-x64"
    name = "cloud-${count.index +1}"
    region = "LON1"
    size = "s-1vcpu-1gb"
    ssh_keys = ["42:61:24:8b:ae:e3:a6:e4:18:f5:e0:8b:3d:55:67:0f"]
}