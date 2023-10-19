terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.9.2"
    }
  }
}

provider "linode" {
    token = "" # linode personal access token
}


# Create first node
resource "linode_instance" "node01" {
    label = "node01"
    image = "linode/ubuntu22.04"
    region = "se-sto"
    type = "g6-nanode-1"
    root_pass = "g9Ac4bFPAvZ6"

    # provisioner "remote-exec" {
    #     inline = [
	# 			"sudo apt-get update -y && sudo apt-get upgrade -y"
    #     	]
    # }
}

# Create second node
resource "linode_instance" "node02" {
    label = "node02"
    image = "linode/ubuntu22.04"
    region = "se-sto"
    type = "g6-nanode-1"
    root_pass = "g9Ac4bFPAvZ6"
}

# Output IP address
output "node01_ip" {
    value = linode_instance.node01.ipv4
}

output "node02_ip" {
    value = linode_instance.node02.ipv4
}

# Save IP addresses to local 'inventory' file
resource "local_file" "inventory" {
    content = "${tolist(linode_instance.node01.ipv4)[0]}\n${tolist(linode_instance.node02.ipv4)[0]}\n"
    filename = "${path.module}/inventory"
}

