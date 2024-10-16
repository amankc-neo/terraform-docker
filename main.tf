terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}


resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "mycontainer" {
  image = docker_image.nginx.image_id
  name  = "mycontainer"

  ports{
    internal = 80
    external = 80
    }
}
