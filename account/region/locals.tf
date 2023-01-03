locals {
  project     = "go-ball"
  region      = "us-east-1"
  
  tags = {
    project     = local.project
    owner       = "InfraTeam"
    terraform   = true
  }
}