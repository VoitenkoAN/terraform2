locals {
   env="develop"
   project="platform"
   role=["web", "db", "disk"]
key_ssh=file("~/.ssh/id_rsa.pub")
}