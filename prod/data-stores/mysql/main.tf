provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "example" {
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = "example_database_prod"
  username          = "admin"
  password          = "${var.db_password}"
}

terraform {
  backend "s3" {
    bucket = "kfsolutions-terraform-up-and-running-state"
    key    = "prod/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
  }
}
