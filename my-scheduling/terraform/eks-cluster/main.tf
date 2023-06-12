
variable "region" {
  type    = string
  default = "us-west-2"
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
}