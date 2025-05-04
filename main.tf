terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "jenkins" {
  name         = "jenkins/jenkins:lts-jdk17"
  keep_locally = false
}

resource "docker_container" "jenkins" {
  image = docker_image.jenkins.image_id
  name  = "tutorial"
  ports {
    internal = 8080
    external = 8080
  }
  ports {
    internal = 50000
    external = 50000
  }
}
